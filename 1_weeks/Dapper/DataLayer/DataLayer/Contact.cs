using Dapper;
using System.Data;
using System.Data.SqlClient;

namespace DataLayer
{
    public class Contact
    {
        public int Id { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Email { get; set; }
        public string Company { get; set; }
        public string Title { get; set; }
        public bool IsNew => this.Id == default(int);
        public List<Address> Addresses { get; } = new List<Address>();
    }

    public class Address
    {
        public int Id { get; set; }
        // one contact can have 
        // multiple address

        public int ContactID { get; set; }
        public string AddressType { get; set; }
        public string StreetAddress { get; set; }
        public string City { get; set; }
        public string StateId { get; set; }
        public string PostalCode { get; set; }
    }


    public interface IContactRepository
    {
        Contact Find(int Id);
        List<Contact> GetAll();
        Contact Add(Contact contact);
        Contact Update(Contact contact);
        void Remove(int Id);
    }

    public class ContactRepository : IContactRepository
    {
        private IDbConnection db;
        public ContactRepository(string connString)
        {
            this.db = new SqlConnection(connString);

        }
        public Contact Add(Contact contact)
        {
            throw new NotImplementedException();
        }

        public Contact Find(int Id)
        {
            throw new NotImplementedException();
        }

        public List<Contact> GetAll()
        {
            return this.db.Query<Contact>("SELECT * FROM Contacts").ToList();
        }

        public void Remove(int Id)
        {
            throw new NotImplementedException();
        }

        public Contact Update(Contact contact)
        {
            throw new NotImplementedException();
        }
    }
}