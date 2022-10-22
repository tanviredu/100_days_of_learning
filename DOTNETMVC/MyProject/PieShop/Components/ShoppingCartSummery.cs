using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using PieShop.Models;
using PieShop.ViewModels;


// this component is like a mini controller
// REMEBER COMPONENT ARE EXACTLY LIKE CONTROLLER-VIEW 
// ONLY DIFFERENCE IT DOES NOT CREATE THE WHOLE PAGE 
// IN CAN BE ADDED LIKE A PARTIALVIEW
// SO IN WORKING IT IS LIKE A CONTROLLER-VIEW
// CAN BE ADDED LIKE A COMPONENT/PARTIAL VIEW
// JUST ONE THING IS THAT THE METHOD NAME WILL BE iNVOKE
// AND IT RETURN IViewComponentResult insted of IActionResult
namespace PieShop.Components
{
    public class ShoppingCartSummery:ViewComponent
    {
        private ShoppingCart _shoppingCart;

        public ShoppingCartSummery(ShoppingCart shoppingCart)
        {
            _shoppingCart = shoppingCart;
        }

        // the method name must be Invoke
        public IViewComponentResult Invoke()
        {
            var items = _shoppingCart.GetShoppingCartItems();
            _shoppingCart.ShoppingCartItems= items;

            var shoppingcartViewModel = new ShoppingCartViewModel
            {
                ShoppingCart = _shoppingCart,
                ShoppingCartTotal = _shoppingCart.GetShoppingCartTotal()
            };
            return View(shoppingcartViewModel);
        }

        
    }
}