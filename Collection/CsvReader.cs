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