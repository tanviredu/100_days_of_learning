using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using PieShop.DataAccess;

namespace PieShop.Models
{
    public class ShoppingCart
    {
        private AppDbContext _appDbContext;
        public ShoppingCart(AppDbContext appDbContext)
        {
            _appDbContext = appDbContext;
        }
        public string? ShoppingCartId { get; set; } // this will be a GUID
        public List<ShoppingCartItem>? ShoppingCartItems { get; set; }

        public void AddToCart(Pie pie, int amount)
        {
            var shoppingCartItem = _appDbContext?.ShoppingCartItems?
            .FirstOrDefault(s => s.Pie.PieId == pie.PieId && s.ShoppingCartId == ShoppingCartId);

            // if it is completely new then create it
            // new item 
            if (shoppingCartItem == null)
            {
                var scartitem = new ShoppingCartItem
                {
                    Amount = 1,
                    Pie = pie,
                    ShoppingCartId = ShoppingCartId
                };
                _appDbContext?.ShoppingCartItems?.Add(scartitem);
            }
            else
            {
                // if there is already item
                // then increase the amount
                shoppingCartItem.Amount++;

            }
            _appDbContext?.SaveChanges();
        }

        public int RemoveFromCart(Pie pie)
        {
            var shoppingCartItem = _appDbContext?.ShoppingCartItems?
            .FirstOrDefault(s => s.Pie.PieId == pie.PieId && s.ShoppingCartId == ShoppingCartId);
            var localamount = 0;
            if (shoppingCartItem != null)
            {
                if (shoppingCartItem.Amount > 1)
                {
                    shoppingCartItem.Amount--;
                    localamount = shoppingCartItem.Amount;
                }
                else
                {
                    _appDbContext?.ShoppingCartItems?.Remove(shoppingCartItem);
                }
            }
            _appDbContext?.SaveChanges();
            return localamount;

        }

        public List<ShoppingCartItem> GetShoppingCartItems()
        {
            var shoppingcartItems = _appDbContext?.ShoppingCartItems?.Where(s => s.ShoppingCartId == ShoppingCartId)
                                    .Include(s => s.Pie).ToList();
            return shoppingcartItems;
        }

        public void ClearCart()
        {
            var items = _appDbContext?.ShoppingCartItems?.Where(s => s.ShoppingCartId == ShoppingCartId);
            _appDbContext?.ShoppingCartItems?.RemoveRange(items);

        }

        public decimal? GetShoppingCartTotal()
        {
            var total = _appDbContext?.ShoppingCartItems?.Where(s => s.ShoppingCartId == ShoppingCartId)
                        .Select(s => s.Pie.Price * s.Amount).Sum();
            return total;

        }

        /* GetCart is just a static method not an instance method
        we need a Shopping cart
        so this method return you a shopping cart with a GUID id
        rest of the thing are same this shoppinf cart object
        can invoke allof its instance method
        this method's soule pur pose is give you a 
        object of shopping cart with your ShoppingCartId Filled with
        a GUID
        */

        // IServiceProvider create instances of your services
        // like database service that you use
        // Session Service
        // and all other serviee you created 
        // create instances/object of your services
        // in controller you can access Session by using
        // HttpContext.Session
        // but in Service you need call the IHttpContextAccessor 

        public static ShoppingCart GetCart(IServiceProvider service)
        {   
            // this is the way of getting session object from Session service in the service leel
            var session = service.GetRequiredService<IHttpContextAccessor>()?.HttpContext?.Session;
            // we need context object
            var context = service.GetService<AppDbContext>(); // create a object From database just like we do in Constructor injection
            // check session for id if null then give it a guid 
            // that means the shoppingCartId will be stored in Session
            string  certId = session.GetString("certId") ?? Guid.NewGuid().ToString();
            
            // now store in th esession
            session.SetString("CertId", certId);

            // now return an object on ShoppingCart with ShoppingCartId
            return new ShoppingCart(context)
            {
                ShoppingCartId = certId
            };
        }














    }
}