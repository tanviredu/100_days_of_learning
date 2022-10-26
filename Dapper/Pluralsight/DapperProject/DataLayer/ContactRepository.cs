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

        public void Remove(int Id)
        {
            var sql = "DELETE FROM Contacts WHERE Id = @Id";
            _context.Execute(sql,new{Id});
            Console.WriteLine($"Row {Id} Is Deleted");
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