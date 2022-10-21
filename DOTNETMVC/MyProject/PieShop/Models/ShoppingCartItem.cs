using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace PieShop.Models
{
    public class ShoppingCartItem
    {
        [Key]
        public int ShoppingCartItemId {get;set;}
        public Pie? Pie {get;set;}
        public int Amount {get;set;}
        public string? ShoppingCartId {get;set;}

    }
}