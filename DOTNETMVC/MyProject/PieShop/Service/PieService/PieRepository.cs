using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using PieShop.DataAccess;
using PieShop.Models;

namespace PieShop.Service.PieService
{
    public class PieRepository : IPieRepository
    {
        private AppDbContext _context;

        public PieRepository(AppDbContext context)
        {
            _context = context;
        }
        public IEnumerable<Pie> AllPies 
        {
            get
            {
               return  _context.Pies.Include(s=>s.Category);
            }
        }

        public IEnumerable<Pie> PiesOfTheWeek 
        {
            get
            {
                return _context.Pies.Include(s=>s.Category).Where(s=>s.IsPieOfTheWeek == true);
            }
        }
        public Pie GetPieById(int pieId)
        {
            var pie = _context.Pies.FirstOrDefault(s=>s.PieId==pieId);
            return pie;
        }
    }
}