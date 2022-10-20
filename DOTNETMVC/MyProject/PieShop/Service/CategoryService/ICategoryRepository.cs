using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using PieShop.Models;

namespace PieShop.Service.CategoryService
{
    public interface ICategoryRepository
    {
        IEnumerable<Category> AllCategories {get;}
    }
}