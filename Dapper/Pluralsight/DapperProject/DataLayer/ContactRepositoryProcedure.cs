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
            // separate the procedure 
            // make one for only insert with nested 
            // not with update
            var sp_name = "SaveContact";
            var parameters = new DynamicParameters();
            
            // this is different because this Id parameter is a output we get from the database
            // we dont provide it
            parameters.Add("@Id",value:contact.Id,dbType:DbType.Int32,direction:ParameterDirection.Output);
            
            
            parameters.Add("@FirstName",contact.FirstName);
            parameters.Add("@LastName",contact.LastName);
            parameters.Add("@Company",contact.Company);
            parameters.Add("@title",contact.Title);
            parameters.Add("@Email",contact.Email);
            _context.Execute(sp_name,parameters,commandType:CommandType.StoredProcedure);
            // after execute we get the id so we assigned
            contact.Id = parameters.Get<int>("@Id");

            foreach(var addr in contact.Addresses){
                var inner_sp = "SaveAddress";
                addr.ContactId = contact.Id;
                var param = new DynamicParameters();
                param.Add("@Id",value:addr.Id,dbType:DbType.Int32,direction:ParameterDirection.Output);
                param.Add("@ContactId",addr.ContactId);
                param.Add("@AddressType",addr.AddressType);
                param.Add("@StreetAddress",addr.StreetAddress);
                param.Add("@City",addr.City);
                param.Add("@StateId",addr.StateId);
                param.Add("@PostalCode",addr.PostalCode);
                _context.Execute(inner_sp,param,commandType:CommandType.StoredProcedure);
                var Id = param.Get<int>("@Id");
                Console.WriteLine("address: " + Id);
            }


        }

        public Contact Update(Contact contact)
        {
            // separate the procedure
            // make this for update only (nested)
             // separate the procedure 
            // make one for only insert with nested 
            // not with update
            var sp_name = "UpdateContact";
            var parameters = new DynamicParameters();
            
            // this is different because this Id parameter is a output we get from the database
            // we dont provide it
            parameters.Add("@Id",value:contact.Id,dbType:DbType.Int32,direction:ParameterDirection.Input);
            
            
            parameters.Add("@FirstName",contact.FirstName);
            parameters.Add("@LastName",contact.LastName);
            parameters.Add("@Company",contact.Company);
            parameters.Add("@title",contact.Title);
            parameters.Add("@Email",contact.Email);
            _context.Execute(sp_name,parameters,commandType:CommandType.StoredProcedure);
            // after execute we get the id so we assigned
            //contact.Id = parameters.Get<int>("@Id");

            foreach(var addr in contact.Addresses){
                var inner_sp = "UpdateAddress";
                addr.ContactId = contact.Id;
                var param = new DynamicParameters();
                param.Add("@Id",value:addr.Id,dbType:DbType.Int32,direction:ParameterDirection.Input);
                param.Add("@ContactId",addr.ContactId);
                param.Add("@AddressType",addr.AddressType);
                param.Add("@StreetAddress",addr.StreetAddress);
                param.Add("@City",addr.City);
                param.Add("@StateId",addr.StateId);
                param.Add("@PostalCode",addr.PostalCode);
                _context.Execute(inner_sp,param,commandType:CommandType.StoredProcedure);
                //var Id = param.Get<int>("@Id");
                //Console.WriteLine("address: " + Id);
            }
            return contact;
        }
        
    }
}
