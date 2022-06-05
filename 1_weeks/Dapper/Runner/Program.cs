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
            //Get_all_should_return_6_results();
            //GetTheFullName();
            //GetFullNamewithFName();
            //insert_should_assign_identity_to_new_entity();
            //GetTheFullName();

            //while (true)
            //{
            //    var id = Console.ReadLine();
            //    GetSingleData(Int32.Parse(id));
            //}
            //UpdateData(2);
            //DeleteData(2);

            JoinGetFullContact(1);
            Console.WriteLine("------------------");
            JoinGetFullContact(3);
            //GetTheFullName();

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


        static void GetTheFullName()
        {
            var repository = CreateRepository();
            var contacts = repository.GetAll();
            var i = 1;
            foreach(var item in contacts)
            {

                Console.WriteLine($"{i}: FullName :  {item.FirstName} {item.LastName} ");
                i++;
            }
        }

       static void GetFullNamewithFName()
        {
            var repository = CreateRepository();
            var contacts = repository.GetAllWithFName();
            int i = 1;
            foreach (var item in contacts)
            {

            //    Console.WriteLine($"{i}: FullName :  {item.Fname} {item.LastName} ");
                i++;
            }
        }

        static int insert_should_assign_identity_to_new_entity()
        {
            var repository = CreateRepository();
            var contact = new Contact
            {
                FirstName = "Joe",
                LastName = "Blow",
                Email = "joe.Blow@gmail.com",
                Company = "Microsoft",
                Title = "Developer"
            };

            repository.Add(contact);
            Console.WriteLine("****** Contact Inserted ******");
            Console.WriteLine($"New Id: {contact.Id}");
            return contact.Id;
        }


        static void GetSingleData(int Id)
        {
            var repository = CreateRepository();
            var contact = repository.Find(Id);
            Console.WriteLine($" Full Name : {contact.FirstName} {contact.LastName}");
        }


        static void UpdateData(int Id)
        {
            var repository = CreateRepository();
            var contact = repository.Find(Id);
            contact.FirstName = "Bob";
            repository.Update(contact);

            //var repository2 = CreateRepository();
            //var modifiedContact = repository.Find(Id);
            

        }


        static void DeleteData(int Id)
        {
            var repository = CreateRepository();
            repository.Remove(Id);
        }


        static void JoinGetFullContact(int Id)
        {
            var repository = CreateRepository();
            var jq = repository.GetFullContact(Id);
            Console.WriteLine($" Name : {jq.FirstName} {jq.LastName}");
            Console.WriteLine("Address : ");
            foreach(var address in jq.Addresses)
            {
                Console.WriteLine(address.StreetAddress);
            }
        }

       
        // in asp dot net core we did with with service
        private static IContactRepository CreateRepository()
        {
            //return new ContactRepository(config.GetConnectionString("DefaultConnection"));
            return new ContactRepository("Server=.\\SQLEXPRESS;Database=ContactsDB;Trusted_Connection=True;");
        }
    }

}
