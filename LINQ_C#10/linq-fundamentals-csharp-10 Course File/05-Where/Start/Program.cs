using LINQSamples;

// Create instance of view model
SamplesViewModel vm = new();

// Call Sample Method
//var result = vm.WhereQuery();
//var result = vm.WhereMethod();
//var result = vm.WhereTwoFieldsQuery();
//var result = vm.WhereTwoFieldsMethod();
//var result = vm.WhereExtensionQuery();
var result = vm.WhereExtensionMethod();
// Display Results
vm.Display(result);