using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using PieShop.Models;

namespace PieShop.Service.PieService
{
    public class PieRepository : IPieRepository
    {
        public IEnumerable<Pie> AllPies => throw new NotImplementedException();

        public IEnumerable<Pie> PiesOfTheWeek => throw new NotImplementedException();

        public Pie GetPieById(int pieId)
        {
            throw new NotImplementedException();
        }
    }
}