namespace LINQSamples
{
  public class SamplesViewModel : ViewModelBase
  {
    #region FirstQuery
    /// <summary>
    /// Locate a specific product using First(). First() searches forward in the collection.
    /// NOTE: First() throws an exception if the result does not produce any values
    /// Use First() when you know or expect the sequence to have at least one element.
    /// Exceptions should be exceptional, so try to avoid them.
    /// </summary>
    public Product FirstQuery()
    {
      List<Product> products = GetProducts();
      Product value = null;

            // Write Query Syntax Here
            // the problem of using First()
            // is that if no match happen it will
            // not give you null it will give you an error
            
            value = (from prod in products select prod).First(s => s.Color == "Red");
            // Test the exception handling

      return value;
    }
    #endregion

    #region FirstMethod
    /// <summary>
    /// Locate a specific product using First(). First() searches forward in the collection.
    /// NOTE: First() throws an exception if the result does not produce any values
    /// Use First() when you know or expect the sequence to have at least one element.
    /// Exceptions should be exceptional, so try to avoid them.
    /// </summary>
    public Product FirstMethod()
    {
      List<Product> products = GetProducts();
      Product value = null;

            // Write Method Syntax Here
            // remember if not found First() will throw error
            value = products.First(s => s.Color == "Red");
            //value = products.First(s => s.Color == "Nothing"); // this will give you error



            return value;
    }
    #endregion

    #region FirstOrDefaultQuery
    /// <summary>
    /// Locate a specific product using FirstOrDefault(). FirstOrDefault() searches forward in the list.
    /// NOTE: FirstOrDefault() returns a null if no value is found
    /// Use FirstOrDefault() when you DON'T know if a collection might have one element you are looking for
    /// Using FirstOrDefault() avoids throwing an exception which can hurt performance
    /// </summary>
    public Product FirstOrDefaultQuery()
    {
      List<Product> products = GetProducts();
      Product value = null;

            // Write Query Syntax Here
            // first or default
            // it will give you result of it there 
            // but return a default value if not found
            // if you dont set any default value then it return null as a default value
            // but you provide it then it will show the default one

            // Test the exception handling

            value = (from prod in products select prod).FirstOrDefault(s => s.Color == "Red");
            // this will return single value which color is red


      return value;
    }
    #endregion

    #region FirstOrDefaultMethod
    /// <summary>
    /// Locate a specific product using FirstOrDefault(). FirstOrDefault() searches forward in the list.
    /// NOTE: FirstOrDefault() returns a null if no value is found
    /// Use FirstOrDefault() when you DON'T know if a collection might have one element you are looking for
    /// Using FirstOrDefault() avoids throwing an exception which can hurt performance
    /// </summary>
    public Product FirstOrDefaultMethod()
    {
      List<Product> products = GetProducts();
      Product value = null;

            // Write Method Syntax Here
            value = products.FirstOrDefault(s => s.Color == "Red");

      return value;
    }
    #endregion

    #region FirstOrDefaultWithDefaultQuery
    /// <summary>
    /// Locate a specific product using FirstOrDefault(). FirstOrDefault() searches forward in the list.
    /// NOTE: You may specify the return value with FirstOrDefault() if not found
    /// Use FirstOrDefault() when you DON'T know if a collection might have one element you are looking for
    /// Using FirstOrDefault() avoids throwing an exception which can hurt performance
    /// </summary>
    public Product FirstOrDefaultWithDefaultQuery()
    {
      List<Product> products = GetProducts();
      Product value = null;
            
            // this will be the default value instead of None
            var defaultvalue = new Product
            {
                ProductID = -1,
                Name = "NOT FOUND"
            };
            // Write Query Syntax Here
            value = (from prod in products select prod).FirstOrDefault(s => s.Color == "No Color", defaultvalue);

     
      // Test the exception handling
      
      return value;
    }
    #endregion

    #region FirstOrDefaultWithDefaultMethod
    /// <summary>
    /// Locate a specific product using FirstOrDefault(). FirstOrDefault() searches forward in the list.
    /// NOTE: You may specify the return value with FirstOrDefault() if not found
    /// Use FirstOrDefault() when you DON'T know if a collection might have one element you are looking for
    /// Using FirstOrDefault() avoids throwing an exception which can hurt performance
    /// </summary>
    public Product FirstOrDefaultWithDefaultMethod()
    {
      List<Product> products = GetProducts();
      Product value = null;
      var defaultvalue = new Product
      {
         ProductID = -1,
         Name = "NOT FOUND"
      };
            // Write Method Syntax Here
            value = products.FirstOrDefault(s => s.Color == "NO COLOR", defaultvalue);

      return value;
    }
    #endregion

    #region LastQuery
    /// <summary>
    /// Locate a specific product using Last(). Last() searches from the end of the list backwards.
    /// NOTE: Last returns the last value from a collection, or throws an exception if no value is found
    /// </summary>
    public Product LastQuery()
    {
      List<Product> products = GetProducts();
      Product value = null;

            // Write Query Syntax Here

            value = (from prod in products select prod).Last(s => s.Color == "Red");
            // Test the exception handling

            return value;
    }
    #endregion

    #region LastMethod
    /// <summary>
    /// Locate a specific product using Last(). Last() searches from the end of the list backwards.
    /// NOTE: Last returns the last value from a collection, or throws an exception if no value is found
    /// </summary>
    public Product LastMethod()
    {
      List<Product> products = GetProducts();
      Product value = null;

            // Write Method Syntax Here
            value = products.Last(s => s.Color == "Red");


            return value;
    }
    #endregion

    #region LastOrDefaultQuery
    /// <summary>
    /// Locate a specific product using LastOrDefault(). LastOrDefault() searches from the end of the list backwards.
    /// NOTE: LastOrDefault returns the last value in a collection or a null if no values are found
    /// </summary>
    public Product LastOrDefaultQuery()
    {
      List<Product> products = GetProducts();
      Product value = null;

            // Write Query Syntax Here
            var defaultvalue = new Product
            {
                ProductID = -1,
                Name = "NOT FOUND"
            };
            value = (from prod in products select prod).LastOrDefault(s => s.Color == "Red", defaultvalue);

            // Test the exception handling

            return value;
    }
    #endregion

    #region LastOrDefaultMethod
    /// <summary>
    /// Locate a specific product using LastOrDefault(). LastOrDefault() searches from the end of the list backwards.
    /// NOTE: LastOrDefault returns the last value in a collection or a null if no values are found
    /// </summary>
    public Product LastOrDefaultMethod()
    {
      List<Product> products = GetProducts();
      Product value = null;
            var defaultvalue = new Product
            {
                ProductID = -1,
                Name = "NOT FOUND"
            };
            // Write Method Syntax Here
            value = products.LastOrDefault(s => s.Color == "No COLOR", defaultvalue);
            // this will return default value

            return value;
    }
    #endregion

    #region SingleQuery
    /// <summary>
    /// Locate a specific product using Single().
    /// NOTE: Single() expects only a single element to be found in the collection, otherwise an exception is thrown
    /// Single() always searches the complete collection
    /// </summary>
    public Product SingleQuery()
    {
      List<Product> products = GetProducts();
      Product value = null;

            // Write Query Syntax Here

            // 1) single method return a single element
            // 2) if not found throw exception
            // 3) if it finds multiple element that satisfies the criteria . it will also throw exception
            // 4) single will return value if matching element is one in the list, no duplicate



            // you will get a value because product id 706 has only one entri and no duplicate
            //value = (from prod in products select prod).Single(s => s.ProductID == 706);

            // this will throw error because multiple object have red color
            //value = (from prod in products select prod).Single(s => s.Color== "Red");
            // System.InvalidOperationException: Sequence contains more than one matching element
            return value;
    }
    #endregion

    #region SingleMethod
    /// <summary>
    /// Locate a specific product using Single().
    /// NOTE: Single() expects only a single element to be found in the collection, otherwise an exception is thrown
    /// Single() always searches the complete collection
    /// </summary>
    public Product SingleMethod()
    {
      List<Product> products = GetProducts();
      Product value = null;

            // Write Method Syntax Here
            value = products.Single(s => s.ProductID == 706);
            
      return value;
    }
    #endregion

    #region SingleOrDefaultQuery
    /// <summary>
    /// Locate a specific product using SingleOrDefault()
    /// NOTE: SingleOrDefault() returns a single element found in the collection, or a null value if none found in the collection, if multiple values are found an exception is thrown.
    /// SingleOrDefault() always searches the complete collection
    /// </summary>
    public Product SingleOrDefaultQuery()
    {
      List<Product> products = GetProducts();
      Product value = null;
            var defaultvalue = new Product
            {
                ProductID = -1,
                Name = "NOT FOUND"
            };

            // you will get the value
            //value = (from prod in products select prod).SingleOrDefault(s => s.ProductID == 706);

            // this will give you the default value
            // because there is not value with productId = -1
            // but remember if it get multiple record it does not give you default it throw error
            products.Clear();
            value = (from prod in products select prod).SingleOrDefault(s=>s.ProductID == -1, defaultvalue);

     

      return value;
    }
    #endregion

    #region SingleOrDefaultMethod
    /// <summary>
    /// Locate a specific product using SingleOrDefault()
    /// NOTE: SingleOrDefault() returns a single element found in the collection, or a null value if none found in the collection, if multiple values are found an exception is thrown.
    /// SingleOrDefault() always searches the complete collection
    /// </summary>
    public Product SingleOrDefaultMethod()
    {
      List<Product> products = GetProducts();
      Product value = null;

      // Write Method Syntax Here
      

      return value;
    }
    #endregion
  }
}
