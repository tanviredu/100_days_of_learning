using System.ComponentModel.DataAnnotations;
using Microsoft.AspNetCore.Mvc.ModelBinding;

namespace PieShop.Models
{
    public class Order
    {
        public Order()
        {
            this.OrderPlaced = DateTime.Now;
        }
        [Key]
        [BindNever]
        public int OrderId {get;set;}
        public List<OrderDetail> OrderDetails {get;set;}
        [Required(ErrorMessage = "Please Enter Your First Name ")]
        [Display(Name ="First Name")]
        [StringLength(50)]
        public string FirstName {get;set;}

        [Required(ErrorMessage = "Please Enter Your Last Name ")]
        [Display(Name ="Last Name")]
        [StringLength(50)]
        public string LastName {get;set;}

        [Required(ErrorMessage = "Please Enter Your Address ")]
        [Display(Name ="Address Line 1")]
        [StringLength(100)]
        public string AddressLine1 {get;set;}

        [Display(Name ="Address Line 2")]
        [StringLength(100)]
        public string? AddressLine2 {get;set;}
        [Required(ErrorMessage = "Please Enter Your ZipCode ")]
        [Display(Name ="Zip Code")]
        [StringLength(10,MinimumLength = 4)]
        public string ZipCode {get;set;}
        
        [Required(ErrorMessage = "Please Enter Your State ")]
        [StringLength(50)]
        public string State {get;set;}

        [Required(ErrorMessage = "Please Enter Your Country ")]
        [StringLength(50)]
        public string Country {get;set;}
        
        [Required(ErrorMessage = "Please Enter Your Phone Number ")]
        [StringLength(25)]
        [Display(Name ="Phone Number")]
        [DataType(DataType.PhoneNumber)] 
        public string PhoneNumber{get;set;}

        [Required]
        [StringLength(50)]
        [DataType(DataType.EmailAddress)]
        [RegularExpression(@"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*|""(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*"")@(?:(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])",
            ErrorMessage = "The email address is not entered in a correct format")]
        public string Email {get;set;}

        [BindNever]
        public int OrderTotal {get;set;} // put type decimal if you want to work on sql server
        [BindNever]
        [ScaffoldColumn(false)]
        public DateTime OrderPlaced{get;set;}



/* What is the job of 
 [BindNever]
 BindNever” attribute is used to tell Model binding,
 which does not bind any value to this parameter
 [ScaffoldColumn(false)]
 you don't want it scaffolded as an EDITABLE field,
 but of course you do want it 
*/



    }
}