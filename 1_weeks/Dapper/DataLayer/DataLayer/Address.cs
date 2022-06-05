namespace DataLayer
{
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
}