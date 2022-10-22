using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using PieShop.Models;
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

        public PieController(IPieRepository pieRepository, ICategoryRepository categoryRepository)
        {
            _pieRepository = pieRepository;
            _categoryRepository = categoryRepository;
        }

        [Route("list")]
        public IActionResult List(string category)
        {
            //   var pieListViewModel = new PieListViewModel();
            //   pieListViewModel.Pies = _pieRepository.AllPies;
            //   pieListViewModel.CurrentCategory = "Cheese Cake";
            //   //return View(_pieRepository.AllPies);
            //   return View(pieListViewModel);

            IEnumerable<Pie> pies;
            string currentCategory;
            if (string.IsNullOrEmpty(category))
            {
                pies = _pieRepository.AllPies.OrderBy(s => s.PieId);
                currentCategory = "All Pies";
            }
            else
            {
                pies = _pieRepository.AllPies.Where(s => s.Category.CategoryName == category)
                                              .OrderBy(p => p.PieId);
                currentCategory = _categoryRepository.AllCategories
                .FirstOrDefault(s => s.CategoryName == category)?.CategoryName;
            }
            var piesListViewModel = new PieListViewModel
            {
                Pies = pies,
                CurrentCategory = currentCategory
            };
            return View(piesListViewModel);



        }
        [Route("Details/{id:int}")]
        public IActionResult Details(int id)
        {
            var pie = _pieRepository.GetPieById(id);
            if (pie == null)
            {
                return NotFound();
            }
            return View(pie);
        }
    }
}