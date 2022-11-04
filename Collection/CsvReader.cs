using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.IO;
namespace Collection
{
    public class CsvReader
    {
        private string _csvFilePath;

        public CsvReader(string csvFilePath)
       {
            _csvFilePath = csvFilePath;
       }

       // get all the country information
       public Country[] ReadFirstNCountries(int nCountries){
       
        // create the array length based on how many country tou wtn to fetched
        Country[] countries = new Country[nCountries];
        using (var sr = new StreamReader(_csvFilePath))
        {
            // omit the first row 
            // because its just the header in the csv file
            sr.ReadLine();

            for(int i=0;i<nCountries;i++){
                string csvLine = sr.ReadLine();
                countries[i] = ReadCountryFromCsvLine(csvLine);
            }
        }
        return countries;
       }

        public List<Country> ReadAllCountriesList(){
            var countries = new List<Country>();
            using(var sr = new StreamReader(_csvFilePath))
            {
                sr.ReadLine(); // omit the first row
                string row;
                while((row = sr.ReadLine()) !=null){
                    countries.Add(ReadCountryFromCsvLineList(row));
                }

            }
            return countries;

        }

        public Dictionary<string,Country> SaveCountriedwithCodeDict(){
            var countries = new Dictionary<string,Country>();
            //using stream reader to read 
            using(StreamReader sr = new StreamReader(_csvFilePath))
            {
                sr.ReadLine();
                string row;
                while((row = sr.ReadLine())!= null){
                    var country =  ReadCountryFromCsvLineList(row);
                    countries.Add(country.Code,country);
                }
            }


            return countries;
        }


        public Country ReadCountryFromCsvLineList(string row)
        {
            var parts = row.Split(',');
            var length = parts.Count();
            if(length>4)
            {
                var name = String.Concat(parts[0],parts[1]);
                name = name.Replace("\"","").Trim(); /// this Code Replace \" with "" . Replace("\"","") means replace what is inside the "" which is \" and Replace with ""
                var code = parts[2];
                var region = parts[3];
                int population;
                int.TryParse(parts[4],out population);
                return new Country(name, code, region, population);
            }
            else
            {
                var name = parts[0];
                var code = parts[1];
                var region = parts[2];
                int population;
                int.TryParse(parts[3],out population);
                return new Country(name,code,region,population);
            }
            
           
        }



        public Country ReadCountryFromCsvLine(string csvLine){
         var parts      = csvLine.Split(',');
         var name       = parts[0];
         var code       = parts[1];
         var region     = parts[2];
         var population =  int.Parse(parts[3]);
         return new Country(name, code, region, population);
       }
    }
}