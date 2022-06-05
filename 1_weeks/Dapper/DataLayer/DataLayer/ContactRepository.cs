using Dapper;
using System.Data;
using System.Data.SqlClient;

namespace DataLayer
{
    public class ContactRepository : IContactRepository
    {
        private IDbConnection db;
        public ContactRepository(string connString)
        {
            this.db = new SqlConnection(connString);

        }
        public Contact Add(Contact contact)
        {
            var sql =
                "INSERT INTO Contacts (FirstName,LastName,Email,Company,Title) VALUES(@FirstName,@LastName,@Email,@Company,@Title); " +
                "SELECT CAST(SCOPE_IDENTITY() as int)";
            
            // you can use the Execute Command 
            var Id = this.db.Query<int>(sql, contact).Single();
            contact.Id = Id;
            return contact;
        }

        public Contact Find(int Id)
        {
            var sql = "SELECT * FROM Contacts WHERE Id = @Id";
            return this.db.Query<Contact>(sql,new { Id}).SingleOrDefault();
        }

        public List<Contact> GetAll()
        {
            var sql = "SELECT * FROM Contacts";
            return this.db.Query<Contact>(sql).ToList();
        }

        public List<Contact> GetAllWithFName()
        {
            var sql = "SELECT FirstName Fname,LastName,Email,Company,Title FROM Contacts";
            return this.db.Query<Contact>(sql).ToList();
        }

        public Contact GetFullContact(int id)
        {
            var sql =
                "SELECT * FROM Contacts WHERE Id = @Id; " +
                "SELECT * FROM Addresses WHERE ContactId = @Id";
            using (var multipleResults = this.db.QueryMultiple(sql,new { Id = id}))
            {
                var contact = multipleResults.Read<Contact>().SingleOrDefault();
                var addresses = multipleResults.Read<Address>().ToList();
                if (contact != null && addresses != null)
                {
                    contact.Addresses.AddRange(addresses);
                }
                return contact;
            }

        }

        public void Remove(int Id)
        {
            var sql = "DELETE FROM Contacts WHERE Id = @Id";
            this.db.Execute(sql, new { Id });
        }

        public Contact Update(Contact contact)
        {
            var sql = "UPDATE Contacts " +
                "SET FirstName = @FirstName, " +
                "    LastName  = @LastName, " +
                "    Email     = @Email, " +
                "    Company   = @Company, " +
                "    Title     = @Title " +
                "WHERE Id = @Id";
            this.db.Execute(sql, contact);
            return contact;
        }
    }
}