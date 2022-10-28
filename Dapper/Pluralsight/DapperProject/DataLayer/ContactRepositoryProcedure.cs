using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;
using DapperProject.POCO;
using Dapper;
using System.Data;

namespace DapperProject.DataLayer
{
    public class ContactRepositoryProcedure : IContactRepository
    {
        private SqlConnection _context;

        public ContactRepositoryProcedure()
        {
             _context = new SqlConnection(Connectonstring.cstring);
        }
        public Contact Add(Contact contact)
        {
            throw new NotImplementedException();
        }

        public Address AddressAdd(Address address)
        {
            throw new NotImplementedException();
        }

        public Address AddrssUpdate(Address address)
        {
            throw new NotImplementedException();
        }

        public Contact Find(int Id)
        {
            var sp_name = "GetContact";
            using(var multipleResults = _context.QueryMultiple(sp_name,new { Id = Id},commandType: CommandType.StoredProcedure)){
                var contact = multipleResults.Read<Contact>().FirstOrDefault();
                return contact;
            }
        }

        public List<Contact> GetAll()
        {
            throw new NotImplementedException();
        }

        public dynamic GetEverything()
        {
            throw new NotImplementedException();
        }

        public Contact GetFullCOntact(int Id)
        {
            // this will return a contact object with a address
            // object nested
            // GetContact Take an argument is Id
            var sp_name = "GetContact";
            using(var multipleResults = _context.QueryMultiple(sp_name,new { Id = Id},commandType:CommandType.StoredProcedure))
            {
                var contact = multipleResults.Read<Contact>().FirstOrDefault();
                var addresses = multipleResults.Read<Address>().ToList();
                contact.Addresses = new List<Address>();
                if(contact!=null && addresses != null){
                    contact.Addresses.AddRange(addresses);
                }
                return contact;

            }

            
        }

        public void Remove(int Id)
        {
            throw new NotImplementedException();
        }

        public void Save(Contact contact)
        {
            // make one for only insert with nested 
            // not with update

            throw new NotImplementedException();
        }

        public Contact Update(Contact contact)
        {
            // make this for update only (nested)

            throw new NotImplementedException();
        }
    }
}