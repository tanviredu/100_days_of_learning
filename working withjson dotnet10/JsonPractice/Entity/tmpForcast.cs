using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace JsonPractice.Entity
{
    public class tmpForcast
    {
        public DateTime Date {get;set;}
        public int TemparetureCelsius {get;set;}
        public string? Summery {get;set;}
        public Feels? FeelsLike {get;set;}
    }
}