using LINQSamples;

// Create instance of view model
SamplesViewModel vm = new();

// Call Sample Method
//var result = vm.UnionIntegersQuery();
//var result = vm.UnionIntegersMethod();
//var result = vm.UnionQuery();
//var result = vm.ConcatIntegersQuery();
var result = vm.ConcatIntegersMethod();
// Display Results
vm.Display(result);