namespace LINQSamples
{
  public class SamplesViewModel : ViewModelBase
  {
    #region UnionIntegersQuery
    /// <summary>
    /// Union() combines two lists together, but skips duplicates
    /// This is like the UNION SQL operator
    /// </summary>
    public List<int> UnionIntegersQuery()
    {
      List<int> list = null;
      // Create a list of numbers
      List<int> list1 = new() { 5, 2, 3, 4, 5 };
      // Create a list of numbers
      List<int> list2 = new() { 1, 2, 3, 4, 5 };

            // Write Query Syntax Here
            list = (from item in list1 select item).Union(list2).ToList();
            // UNION dont take duplicate valiuue

      return list;
    }
    #endregion

    #region UnionIntegersMethod
    /// <summary>
    /// Union() combines two lists together, but skips duplicates
    /// This is like the UNION SQL operator
    /// </summary>
    public List<int> UnionIntegersMethod()
    {
      List<int> list = null;
      // Create a list of numbers
      List<int> list1 = new() { 5, 2, 3, 4, 5 };
      // Create a list of numbers
      List<int> list2 = new() { 1, 2, 3, 4, 5 };

            // Write Query Syntax Here
            list = list1.Union(list2).ToList();
            // union does not take duplicate value

      return list;
    }
    #endregion

    #region UnionQuery
    /// <summary>
    /// Union() combines two lists together, but skips duplicates by using a comparer class
    /// This is like the UNION SQL operator
    /// </summary>
    public List<Product> UnionQuery()
    {
      List<Product> list = null;
      ProductComparer pc = new();
      // Load all Product Data
      List<Product> list1 = ProductRepository.GetAll();
      // Load all Product Data
      List<Product> list2 = ProductRepository.GetAll();

            // Write Query Syntax Here
            list = (from item in list1 select item).Union(list2).ToList();
     

      return list;
    }
    #endregion


    #region ConcatIntegersQuery
    /// <summary>
    /// The Concat() operator combines two lists together and does NOT check for duplicates
    /// This is like the UNION ALL SQL operator
    /// </summary>
    public List<int> ConcatIntegersQuery()
    {
      List<int> list = null;
      // Create a list of numbers
      List<int> list1 = new() { 5, 2, 3, 4, 5 };
      // Create a list of numbers
      List<int> list2 = new() { 1, 2, 3, 4, 5 };

            // Write Query Syntax Here
            // remember concat keep duplicate union dont
            // concate keep duplicate
            list = (from item in list1 select item).Concat(list2).ToList();
            // result will be 1234512345
      return list;
    }
    #endregion

    #region ConcatIntegersMethod
    /// <summary>
    /// The Concat() operator combines two lists together and does NOT check for duplicates
    /// This is like the UNION ALL SQL operator
    /// </summary>
    public List<int> ConcatIntegersMethod()
    {
      List<int> list = null;
      // Create a list of numbers
      List<int> list1 = new() { 5, 2, 3, 4, 5 };
      // Create a list of numbers
      List<int> list2 = new() { 1, 2, 3, 4, 5 };

            // Write Query Syntax Here
            list = list1.Concat(list2).ToList();
            // 1234512345
            // because concat keep duplicate unon not

      return list;
    }
    #endregion

   
  }
}
