using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using PieShop.DataAccess;
using PieShop.Models;

namespace PieShop.Service.CategoryService
{
    public class CategoryRepository : ICategoryRepository
    {
        private AppDbContext _context;

        public CategoryRepository(AppDbContext context)
        {
            _context = context;
        }
        public IEnumerable<Category> AllCategories 
        {
            get
            {
                return _context.Categories;
            }
        }
    }
}