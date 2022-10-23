using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;

namespace PieShop.Controllers
{
    [Route("[controller]")]
    public class OrderController : Controller
    {
     

        public OrderController()
        {
            
        }
        // this will take you to order page
        public IActionResult Index()
        {
            return View();
        }

        public IActionResult CheckoutComplete()
        {
            ViewBag.Message = "Thanks for your order.We will Soon Contact you";
            return View();
        }

    }
}