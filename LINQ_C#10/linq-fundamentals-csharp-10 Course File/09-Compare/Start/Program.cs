using LINQSamples;

// Create instance of view model
SamplesViewModel vm = new();

// Call Sample Method
//var result = vm.SequenceEqualIntegersQuery();
//var result = vm.SequenceEqualObjectsQuery();
var result = vm.ExceptIntegersQuery();
// Display Results
vm.Display(result);