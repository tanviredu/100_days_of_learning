using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace PieShop.Models
{
    public class Pie
    {
        public int PieId {get;set;}
        public string? Name {get;set;}
        public string? ShortDescription {get;set;}
        public string? LongDescription {get;set;}
        public string? Allergyinformation {get;set;}
        public int Price {get;set;} // this price is set to int sqlite3 does not support linq SUM() on decimal
        public string? ImageUrl {get;set;}
        public string? ImageThumbnailUrl {get;set;}
        public bool IsPieOfTheWeek {get;set;}
        public bool InStock {get;set;}
        public int? CategoryId {get;set;}
        public Category? Category {get;set;}

        
    }
}