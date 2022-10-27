using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;
using Dapper.Contrib.Extensions;
using DapperProject.POCO;

namespace DapperProject.DataLayer
{
    public class DapperContribRepository //: IContactRepository
    {
        private SqlConnection _context;

        public DapperContribRepository()
        {
            _context = new SqlConnection(Connectonstring.cstring);
        }
        public Contact Add(Contact contact)
        {
            var id = _context.Insert(contact);
            contact.Id = (int)id; // assign new property
            return contact;
        }

        public Contact Find(int Id)
        {
            var data  =  _context.Get<Contact>(Id);
            return data;
        }

        public List<Contact> GetAll()
        {
            // this will show an error
            // because dapper contrib 
            // asume your entity name is not 
            return _context.GetAll<Contact>().ToList();
        }

        public void Remove(int Id)
        {
            _context.Delete(new Contact{Id = Id}); // this will by default remove the Contracts by id thatswhy we providing the id
        }

        public Contact Update(Contact contact)
        {
            _context.Update(contact);
            return contact;
        }
    }
}