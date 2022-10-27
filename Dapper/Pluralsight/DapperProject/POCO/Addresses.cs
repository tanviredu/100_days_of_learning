namespace DapperProject.POCO;

public class Address
{
    public int Id { get; set; }
    public int ContactId {get;set;}
    public string? AddressType {get;set;}
    public string? StreetAddress {get;set;}
    public string? City {get;set;}
    public int StateId {get;set;}
    public State? State {get;set;}
    public string? PostalCode {get;set;}
}