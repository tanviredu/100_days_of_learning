namespace LINQSamples
{
  public class SamplesViewModel : ViewModelBase
  {

        // all is going to return a boolean
        // it means do all item do that
        // suppuse All(s=>s.price>100);
        // means does all item has price greater than 100
        // replace multiple AND statement

        // any() return a boolean
        // it means does any (at least one) item do that
        //suppuse ANy(s=>s.price>100);
        // means does any item has price greater than 100
        // replace multiple OR statement









    #region AllQuery
        /// <summary>
        /// Use All() to see if all items in a collection meet a specified condition
        /// </summary>
        public bool AllQuery()
    {
      List<Product> products = GetProducts();
      bool value = false;

            // Write Query Syntax Here
            value = (from prod in products select prod).All(prod => prod.StandardCost > 10);
            // value is false because at least 1 product has price less then equal 10
      

      return value;
    }
    #endregion

    #region AllMethod
    /// <summary>
    /// Use All() to see if all items in a collection meet a specified condition
    /// </summary>
    public bool AllMethod()
    {
      List<Product> products = GetProducts();
      bool value = false;

            // Write Method Syntax Here
            value = products.All(s => s.StandardCost > 10);
      

      return value;
    }
    #endregion

   

    #region AnyQuery
    /// <summary>
    /// Use Any() to see if at least one item in a collection meets a specified condition
    /// </summary>
    public bool AnyQuery()
    {
      List<SalesOrder> sales = GetSales();
      bool value = false;

            // Write Query Syntax Here
            value = (from s in sales select s).Any(s => s.SalesOrderID < 10000);
      

      return value;
    }
    #endregion

    #region AnyMethod
    /// <summary>
    /// Use Any() to see if at least one item in a collection meets a specified condition
    /// </summary>
    public bool AnyMethod()
    {
      List<SalesOrder> sales = GetSales();
      bool value = false;

            // Write Method Syntax Here
            value = sales.Any(s => s.SalesOrderID < 10000);


            return value;
    }
    #endregion

    #region ContainsQuery
    /// <summary>
    /// Use the Contains() operator to see if a collection contains a specific value
    /// </summary>
    public bool ContainsQuery()
    {
      List<int> numbers = new() { 1, 2, 3, 4, 5 };
      bool value = false;

            // Write Query Syntax Here
            value = (from n in numbers select n).Contains(3);

      

      return value;
    }
    #endregion

    #region ContainsMethod
    /// <summary>
    /// Use the Contains() operator to see if a collection contains a specific value
    /// </summary>
    public bool ContainsMethod()
    {
      List<int> numbers = new() { 1, 2, 3, 4, 5 };
      bool value = false;

            // Write Method Syntax Here
            value = numbers.Contains(6);
            // return false
      

      return value;
    }
    #endregion

    #region ContainsComparerQuery
    /// <summary>
    /// Use the Contains() operator to see if a collection contains a specific value
    /// </summary>
    public bool ContainsComparerQuery()
    {
      List<Product> products = GetProducts();
      ProductIdComparer pc = new();
      bool value = false;

      // Write Query Syntax Here
      

      return value;
    }
    #endregion

    #region ContainsComparerMethod
    /// <summary>
    /// Use the Contains() operator to see if a collection contains a specific value.
    /// When comparing classes, you need to write a EqualityComparer class.
    /// </summary>
    public bool ContainsComparerMethod()
    {
      List<Product> products = GetProducts();
      ProductIdComparer pc = new();
      bool value = false;

      // Write Method Syntax Here
      

      return value;
    }
    #endregion
  }
}
