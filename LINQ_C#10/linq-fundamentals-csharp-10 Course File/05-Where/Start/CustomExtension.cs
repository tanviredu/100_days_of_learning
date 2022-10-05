using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LINQSamples
{
    public static class CustomExtension
    {
        public static IEnumerable<Product>CustomByColor(this IEnumerable<Product> query,string color)
        {
            return query.Where(p => p.Color == color);
        }
    }
}


/*
    1) to make a extension method you need to declare a ststic class
    2) there are two parameter first IEnumrable<Entity> and color
    3) there is a this keyword in front of the IEnumrable<Entity> 
    4) when thsi extension is invoked only color property have to be gitven
    5) first argement will automatically get the data because this means in this context
    6) so when you work with linq first argument will be autometcally filled
    7) remember class and method have to be static
 
 */