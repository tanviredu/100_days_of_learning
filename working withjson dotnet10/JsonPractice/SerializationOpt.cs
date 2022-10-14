using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.Json;
using System.Threading.Tasks;
using JsonPractice.Entity;

namespace JsonPractice
{
    // serialization with 
    // serialization options
    public class SerializationOpt
    {
        private readonly JsonSerializerOptions options;

        public SerializationOpt()
        {
            
            options = new JsonSerializerOptions();
            options.WriteIndented = true;
            options.PropertyNameCaseInsensitive = true; //it will omit the ccase when serializing and deserializing
            options.PropertyNamingPolicy = JsonNamingPolicy.CamelCase; // this will convert the json property name camelcase
        }
    

        public Coordinates getCoordinates()
        {
            var coordinate = new Coordinates{
                Lat = 10.55,
                Lon = 6.45
            };
            return coordinate;

        }

        public Wind GetWind(){
            var wind = new Wind{
                Degree = 10,
                Gust = 34.9,
                Speed = 12.0
            };
            return wind;
        }

        public void serialize_coordinate(){
            // this is without serialization option
            var co = getCoordinates();
            var jsonstring = JsonSerializer.Serialize(co);
            Console.WriteLine(jsonstring);
        }

        public void serialize_coordinate_with_opt(){
            var co = getCoordinates();
            var jsonString = JsonSerializer.Serialize(co,options);
            Console.WriteLine(jsonString);

        }
    
        // same option with the wind
        public void get_wind_serializer(){
            var winds = GetWind();
            var jsonString = JsonSerializer.Serialize(winds,options);
            Console.WriteLine(jsonString);
        }





    }
}