using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using PieShop.Service.PieService;
using PieShop.ViewModels;

namespace PieShop.Controllers
{
    // this will be app's entry point /index page
    [Route("")]
    public class HomeController : Controller
    {
        private IPieRepository _pieRepository;

        public HomeController(IPieRepository pieRepository)
        {
            _pieRepository = pieRepository;
        }

        [Route("")]
        public IActionResult Index()
        {
           var homeViewModel = new HomeViewModel
           {
             PiesOFTheWeek = _pieRepository.PiesOfTheWeek
           };
            return View(homeViewModel); // view will be in home directory by convention


        }

    }
}