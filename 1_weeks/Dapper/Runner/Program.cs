// See https://aka.ms/new-console-template for more information
using DataLayer;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Configuration.Json;
using System.Diagnostics;

namespace Runner
{
    class Program
    {
        private static IConfigurationRoot config;
        static void Main(string[] args)
        {
            //Console.WriteLine("Hello world");
            Initialize();

            Get_all_should_return_6_results();
        }

        static void Get_all_should_return_6_results()
        {
            // arrange
            
            var repository = CreateRepository();
            // act
            
            var contacts = repository.GetAll();
            // assert

            Console.WriteLine($"Count : {contacts.Count}");
            Debug.Assert(contacts.Count == 6);
            
        }

        private static void Initialize()
        {
            var builder = new ConfigurationBuilder()
                .SetBasePath(Directory.GetCurrentDirectory())
                .AddJsonFile("appsettings.json", optional: true, reloadOnChange: true);
            config = builder.Build();
        }
        
        // in asp dot net core we did with with service
        private static IContactRepository CreateRepository()
        {
            //return new ContactRepository(config.GetConnectionString("DefaultConnection"));
            return new ContactRepository("Server=.\\SQLEXPRESS;Database=ContactsDB;Trusted_Connection=True;");
        }
    }

}
