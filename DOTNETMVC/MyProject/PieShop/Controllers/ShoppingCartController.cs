using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using PieShop.Models;
using PieShop.Service.PieService;
using PieShop.ViewModels;

namespace PieShop.Controllers
{
    [Route("[controller]")]
    // view will re related to the controller name
    public class ShoppingCartController : Controller
    {
        private IPieRepository _pieRepository;
        private ShoppingCart _shoppingCart;

        public ShoppingCartController(IPieRepository pieRepository,ShoppingCart shoppingCart) 
        {
            _pieRepository = pieRepository;
            _shoppingCart = shoppingCart;
        }

        public IActionResult Index()
        {
            var items = _shoppingCart.GetShoppingCartItems();
            _shoppingCart.ShoppingCartItems = items;

            var shoppingCartViewModel = new ShoppingCartViewModel
            {
                ShoppingCart = _shoppingCart,
                ShoppingCartTotal = _shoppingCart.GetShoppingCartTotal()
                
            };

            return View(shoppingCartViewModel);
        }

        [Route("Add/{pieId:int}")]
        public RedirectToActionResult AddToShoppingCart(int pieId)
        {
            var selectedPie = _pieRepository.AllPies.FirstOrDefault(s=>s.PieId == pieId);
            if(selectedPie != null)
            {
                _shoppingCart.AddToCart(selectedPie,1);
            }
            return RedirectToAction("Index");
        }
        [Route("Remove/{pieId:int}")]
        public  RedirectToActionResult RemoveFromShoppingCart(int pieId)
        {
            var selectedPie = _pieRepository.AllPies.FirstOrDefault(s => s.PieId == pieId);
            if(selectedPie != null){
                _shoppingCart.RemoveFromCart(selectedPie);
            }
            return RedirectToAction("Index");

        }
        

        
    }
}