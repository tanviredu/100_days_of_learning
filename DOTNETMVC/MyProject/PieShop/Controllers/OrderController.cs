using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using PieShop.Models;
using PieShop.Service.OrderService;

namespace PieShop.Controllers
{
    [Route("[controller]")]
    public class OrderController : Controller
    {
        private IOrderRepository _orderRepository;
        private ShoppingCart _shoppingCart;

        public OrderController(IOrderRepository orderRepository,ShoppingCart shoppingCart ) 
        {
            _orderRepository = orderRepository;
            _shoppingCart = shoppingCart;
        }
        // this will take you to order page
        [HttpGet("placeorder")]
        public IActionResult Checkout()
        {
            return View();
        }

        [HttpPost("placeorder")]
        public IActionResult Checkout(Order order)
        {
            // first check if he has anything
            // in his cart
            var items = _shoppingCart.GetShoppingCartItems();
            _shoppingCart.ShoppingCartItems= items;
            if(_shoppingCart.ShoppingCartItems.Count == 0){
                ModelState.AddModelError("", "You have no item in shopping cart");
            }
            if(ModelState.IsValid){
                _orderRepository.CreateOrder(order);
                _shoppingCart.ClearCart();
                return RedirectToAction("CheckoutComplete");
            }
            return View(order); // return to same view with prefilled information
           

        }

        [Route("success")]
        public IActionResult CheckoutComplete()
        {
            ViewBag.Message = "Thanks for your order.We will Soon Contact you";
            return View();
        }

    }
}