using LINQSamples;

// Create instance of view model
SamplesViewModel vm = new();

// Call Sample Method
//var result = vm.AllQuery();
//var result = vm.AllMethod();
//var result = vm.AnyQuery();
//var result = vm.AnyMethod();
var result = vm.ContainsMethod();

// Display Results
vm.Display(result);