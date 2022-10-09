using LINQSamples;

// Create instance of view model
SamplesViewModel vm = new();

// Call Sample Method
//var result = vm.SequenceEqualIntegersQuery();
//var result = vm.SequenceEqualObjectsQuery();
//var result = vm.ExceptIntegersQuery();
//var result = vm.IntersectIntegersQuery();
//var result = vm.IntersectIntegersMethod();
//var result = vm.IntersectProductSalesMethod();
var result = vm.IntersectProductSalesMethod();
// Display Results
vm.Display(result);