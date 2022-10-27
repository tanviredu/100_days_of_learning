using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;
using Dapper;
using DapperProject.POCO;

namespace DapperProject.DataLayer
{
    public class ContactRepository : IContactRepository
    {
        public SqlConnection _context;

        public ContactRepository()
        {
            _context = new SqlConnection(Connectonstring.cstring);
        }
        public Contact Add(Contact contact)
        {
   
            var sql = "INSERT INTO Contacts(Firstname, LastName,Email,Company,Title) VALUES(@FirstName,@LastName,@Email,@Company,@Title); "+
                      "SELECT CAST(SCOPE_IDENTITY() AS INT);";
            var id = _context.Query<int>(sql,contact).Single();
            contact.Id = id;
            return contact;
            
        }

        public Address AddressAdd(Address address)
        {
            var sql = "INSERT INTO Addresses(ContactId, AddressType,StreetAddress,City,StateId,PostalCode) VALUES(@ContactId, @AddressType,@StreetAddress,@City,@StateId,@PostalCode); "+
                      "SELECT CAST(SCOPE_IDENTITY() AS INT);";
            var id = _context.Query<int>(sql,address).Single();
            address.Id = id;
            return address;
        }

        public Address AddrssUpdate(Address address)
        {
            var sql = "UPDATE Addresses SET AddressType = @AddressType,StreetAddress = @StreetAddress,City = @City,StateId = @StateId,PostalCode = @PostalCode WHERE Id = @Id;";
            _context.Execute(sql,address);
            return address;
        }

        public Contact Find(int Id)
        {
            var sql = "SELECT * FROM Contacts WHERE Id = @Id";
            var contact = _context.Query<Contact>(sql,new { Id }).FirstOrDefault();
            return contact;
        }

        public List<Contact> GetAll()
        {
            var data = _context.Query<Contact>("SELECT * FROM Contacts").ToList();
            return data;
        }

        public dynamic GetEverything()
        {
            var sql = "SELECT C.*,AD.StateId,S.StateName FROM Contacts C join Addresses AD ON C.Id = AD.ContactId join States S ON S.Id = AD.StateId;";
            var data = _context.Query(sql);
            return data;

        }


        

        public Contact GetFullCOntact(int Id)
        {

            var sql = "SELECT * FROM Contacts WHERE Id=@Id; " +
                      "SELECT * FROM Addresses WHERE ContactId=@Id";
            // rmember the id you want to provide should be inside
            // of an annonymous object
            using(var multipleRecords = _context.QueryMultiple(sql,new { Id = Id})){
                    var contact = multipleRecords.Read<Contact>().FirstOrDefault();
                    var addresses = multipleRecords.Read<Address>().ToList();
                    //contact.Addresses = new List<Address>();
                    // make sure it already initialize in the entity or in here
                    // check if null
                    if(contact !=null && addresses!=null){
                        contact.Addresses.AddRange(addresses);
                    }

                    return contact;
                }
        }

        public void Remove(int Id)
        {
            var sql = "DELETE FROM Contacts WHERE Id = @Id";
            _context.Execute(sql,new{Id});
            Console.WriteLine($"Row {Id} Is Deleted");
        }

        public void Save(Contact contact)
        {
            throw new NotImplementedException();
        }

        public Contact Update(Contact contact)
        {
            var sql = "UPDATE Contacts SET FirstName = @FirstName, LastName = @LastName,Email = @Email,Company = @Company,Title = @Title WHERE Id = @Id";
            _context.Execute(sql,contact);
            Console.WriteLine("Deleted");
            return contact;

        }
        
    }
}





// if your query was only has select clause means you are fetching the data
// then it is _context.Query<>();
// if it is insert,update,delete then db.Execute();
// but if you are writing multiple query like insert then select then
// you have to use _context.Query();




// Dapper for nested field
