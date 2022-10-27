using Dapper.Contrib.Extensions;

namespace DapperProject.POCO;

public class Contact
{
    
    public int Id { get; set; }
    public string? FirstName {get;set;}
    public string? LastName {get;set;}
    public string? Email {get;set;}
    public string? Company {get;set;}
    public string? Title {get;set;}
    [Write(false)]
    public List<Address>? Addresses {get;set;} = new List<Address>();
}

// [Write(false)] will not try to write the Addresses into the database
// it is a computed field 
// otherwise ehwn you _context.Add(contact) it it will throw error
// and say there are not column name Address 
// this addresses will be come at a select query
// when we join the query and execute 