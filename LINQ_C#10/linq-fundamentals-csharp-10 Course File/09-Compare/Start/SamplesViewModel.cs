namespace LINQSamples
{
  public class SamplesViewModel : ViewModelBase
  {
    #region SequenceEqualIntegersQuery
    /// <summary>
    /// SequenceEqual() compares two different collections to see if they are equal
    /// When using simple data types such as int, string, a direct comparison between values is performed
    /// </summary>
    public bool SequenceEqualIntegersQuery()
    {
      bool value = false;
      // Create a list of numbers
      List<int> list1 = new() { 5, 2, 3, 4, 5 };
      // Create a list of numbers
      List<int> list2 = new() { 1, 2, 3, 4, 5 };

            // Write Query Syntax Here
            value = (from item in list1 select item).SequenceEqual(list2);

      return value;
    }
    #endregion

    #region SequenceEqualIntegersMethod
    /// <summary>
    /// SequenceEqual() compares two different collections to see if they are equal
    /// When using simple data types such as int, string, a direct comparison between values is performed
    /// </summary>
    public bool SequenceEqualIntegersMethod()
    {
      bool value = false;
      // Create a list of numbers
      List<int> list1 = new() { 5, 2, 3, 4, 5 };
      // Create a list of numbers
      List<int> list2 = new() { 1, 2, 3, 4, 5 };

            // Write Method Syntax Here
            value = list1.SequenceEqual(list2);

      return value;
    }
    #endregion

    #region SequenceEqualObjectsQuery
    /// <summary>
    /// When using a collection of objects, SequenceEqual() performs a comparison to see if the two object references point to the same object
    /// </summary>
    public bool SequenceEqualObjectsQuery()
    {
      bool value = false;
      // Create a list of products
      List<Product> list1 = new()
      {
        new Product { ProductID = 1, Name = "Product 1" },
        new Product { ProductID = 2, Name = "Product 2" },
      };
      // Create a list of products
      List<Product> list2 = new()
      {
        new Product { ProductID = 1, Name = "Product 1" },
        new Product { ProductID = 2, Name = "Product 2" },
      };

            // Make Collections the Same
            // list2 = list1;

            // Write Query Syntax Here
            value = (from prod in list1 select prod).SequenceEqual(list2);
            // it will return a false
            // because it compaer the object referecnce 
            // even the value are the same 
            // object reference are different

      return value;
    }
    #endregion

    #region SequenceEqualObjectsMethod
    /// <summary>
    /// When using a collection of objects, SequenceEqual() performs a comparison to see if the two object references point to the same object
    /// </summary>
    public bool SequenceEqualObjectsMethod()
    {
      bool value = false;
      // Create a list of products
      List<Product> list1 = new()
      {
        new Product { ProductID = 1, Name = "Product 1" },
        new Product { ProductID = 2, Name = "Product 2" },
      };
      // Create a list of products
      List<Product> list2 = new()
      {
        new Product { ProductID = 1, Name = "Product 1" },
        new Product { ProductID = 2, Name = "Product 2" },
      };

            value = list1.SequenceEqual(list2); // it will also return false
      

      return value;
    }
    #endregion


    #region ExceptIntegersQuery
    /// <summary>
    /// Find all values in one list that are not in the other list
    /// </summary>
    public List<int> ExceptIntegersQuery()
    {
      List<int> list = null;
      // Create a list of numbers
      List<int> list1 = new() { 5, 2, 3, 4, 5 };
      // Create a list of numbers
      List<int> list2 = new() { 3, 4, 5 };

            // Write Query Syntax Here
            // except will return between two collection
            // which is NOT COMMON

            //list = list1.Except(list2).ToList();
            list = list2.Except(list1).ToList();

      return list;
    }
    #endregion

    #region ExceptIntegersMethod
    /// <summary>
    /// Find all values in one list that are not in the other list
    /// </summary>
    public List<int> ExceptIntegersMethod()
    {
      List<int> list = null;
      // Create a list of numbers
      List<int> list1 = new() { 5, 2, 3, 4, 5 };
      // Create a list of numbers
      List<int> list2 = new() { 3, 4, 5 };

      // Write Method Syntax Here
      

      return list;
    }
    #endregion

    #region ExceptProductSalesQuery
    /// <summary>
    /// Find all products that do not have sales
    /// </summary>
    public List<int> ExceptProductSalesQuery()
    {
      List<int> list = null;
      List<Product> products = ProductRepository.GetAll();
      List<SalesOrder> sales = SalesOrderRepository.GetAll();

      // Write Query Syntax Here
      // get all the productsId
      // get All the sales Id
      // which numbers are in products and not in sales
      //list = (from prod in products select prod.ProductID).Except()


      

      return list;
    }
    #endregion

    

    #region ExceptByQuery
    /// <summary>
    /// ExceptBy() finds products within a collection that DO NOT compare to a List<string> against a specified property in the collection.
    /// The default comparer for ExceptBy() is 'string'
    /// </summary>
    public List<Product> ExceptByQuery()
    {


      // This is important
      List<Product> list = null;
      // Load all Product Data
      List<Product> products = ProductRepository.GetAll();

      // The list of colors to exclude from the list
      List<string> colors = new() { "Red", "Black" };

      // Write Query Syntax Here
      

      return list;
    }
    #endregion


    #region IntersectIntegersQuery
    /// <summary>
    /// Intersect() finds all values in one list that are also in the other list
    /// </summary>
    public List<int> IntersectIntegersQuery()
    {
      List<int> list = null;
      // Create a list of numbers
      List<int> list1 = new() { 5, 2, 3, 4, 5 };
      // Create a list of numbers
      List<int> list2 = new() { 3, 4, 5 };

      // Write Query Syntax Here
      
            list = (from prod in list1 select prod).Intersect(list2).ToList();


      return list;
    }
    #endregion

    #region IntersectIntegersMethod
    /// <summary>
    /// Intersect() finds all values in one list that are also in the other list
    /// </summary>
    public List<int> IntersectIntegersMethod()
    {
      List<int> list = null;
      // Create a list of numbers
      List<int> list1 = new() { 5, 2, 3, 4, 5 };
      // Create a list of numbers
      List<int> list2 = new() { 3, 4, 5 };

            // Write Method Syntax Here
            list = list1.Intersect(list2).ToList();

      return list;
    }
    #endregion

    #region IntersectProductSalesQuery
    /// <summary>
    /// Find all products that have sales
    /// </summary>
    public List<int> IntersectProductSalesQuery()
    {
      List<int> list = null;
      List<Product> products = ProductRepository.GetAll();
      List<SalesOrder> sales = SalesOrderRepository.GetAll();

      // Write Query Syntax Here
      

      return list;
    }
    #endregion

    #region IntersectProductSalesMethod
    /// <summary>
    /// Find all products that have sales
    /// </summary>
    public List<int> IntersectProductSalesMethod()
    {
      List<int> list = null;
      List<Product> products = ProductRepository.GetAll();
      List<SalesOrder> sales = SalesOrderRepository.GetAll();

            //list = (from prod in products select prod.ProductID).Intersect(from sale in sales select sale.ProductID).ToList();
            list = products.Select(s => s.ProductID).Intersect(sales.Select(s => s.ProductID)).ToList();
      return list;
    }
    #endregion

   

   
  }
}
