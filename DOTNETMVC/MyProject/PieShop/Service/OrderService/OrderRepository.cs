using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using PieShop.DataAccess;
using PieShop.Models;

namespace PieShop.Service.OrderService
{
    public class OrderRepository : IOrderRepository
    {
        private AppDbContext _appDbcontext;
        private ShoppingCart _shoppingCart;

        public OrderRepository(AppDbContext appDbcontext,ShoppingCart shoppingCart)
        {
            _appDbcontext = appDbcontext;
            _shoppingCart = shoppingCart;
        }
        public void CreateOrder(Order order)
        {
            //easy
            // the order items are stored 
            // with a guid stored in a session so 
            // when anyone add items in the shopping cart
            // it will be stored with respect to user's GUID
            // which is auto generated
            // then when we create order 
            // based on the guid all the products
            // will be added in the order
            // with user information
            
            

            var shoppingCartItem = _shoppingCart.ShoppingCartItems;
            order.OrderTotal = _shoppingCart.GetShoppingCartTotal();
            order.OrderDetails = new List<OrderDetail>();
            foreach(var item in shoppingCartItem){
                var orderdetail = new OrderDetail
                {
                    Amount = item.Amount,
                    PieId = item.Pie.PieId,
                    Price = item.Pie.Price,
                };
                order.OrderDetails.Add(orderdetail);
            }

            _appDbcontext.Orders.Add(order);
            _appDbcontext.SaveChanges();
        }
    }
}