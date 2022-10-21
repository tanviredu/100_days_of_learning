using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;

namespace PieShop.Controllers
{
    //[Route("[controller]")]
    public class ShoppingCartController : Controller
    {
        
        public ShoppingCartController()
        {
            
        }

        public IActionResult Index()
        {
            return View();
        }

        
    }
}