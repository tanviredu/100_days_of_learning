using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Razor.TagHelpers;

namespace PieShop.TagHelpers
{
    public class EmailTagHelper:TagHelper
    {
        public string Address {get;set;}
        public string Text{get;set;}

        // we need to register this tag helper 
        // in _Viewimports.cshtml file
        public override void  Process(TagHelperContext context, TagHelperOutput output)
        {
            output.TagName = "a";
            output.Attributes.SetAttribute("href","mailto:"+Address);
            output.Content.SetContent(Text);


            // EXPLANATION

            //FROM CLASS NAME 'EmailTagHelper'
            // the tagname will be just 'email'
            // it will be an anchor tag
            // and its href = "mailto:"+Address
            // and Contect that will show will be Content attribute
            //<email address="tanviredu2018@gmail.com" text = "Click Here"></email>
            // will be converted into 
            // <a href="mailto:tanviredu2018@gmail.com">Click Here</a>
       
       
       
        }   


    }
}