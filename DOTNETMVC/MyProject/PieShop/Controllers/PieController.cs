using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using PieShop.Service.CategoryService;
using PieShop.Service.PieService;
using PieShop.ViewModels;

namespace PieShop.Controllers
{
    [Route("[controller]")]
    public class PieController : Controller
    {
        private IPieRepository _pieRepository;
        private ICategoryRepository _categoryRepository;

        public PieController(IPieRepository pieRepository,ICategoryRepository categoryRepository)
       {
            _pieRepository      = pieRepository;
            _categoryRepository = categoryRepository;
       }

       public ViewResult List()
       {    
            var pieListViewModel = new PieListViewModel();
            pieListViewModel.Pies = _pieRepository.AllPies;
            pieListViewModel.CurrentCategory = "Cheese Cake";
            //return View(_pieRepository.AllPies);
            return View(pieListViewModel);
       }
    }
}