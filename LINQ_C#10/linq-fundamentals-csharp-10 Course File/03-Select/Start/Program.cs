using LINQSamples;

// Create instance of view model
SamplesViewModel vm = new();

// Call Sample Method
//var result = vm.GetAllQuery();
//var result = vm.GetAllMethod();
//var result = vm.GetSingleColumnQuery();
// var result = vm.GetSingleColumnMethod();
//var result = vm.GetSpecificColumnsQuery();
//var result = vm.GetSpecificColumnsMethod();
//var result = vm.AnonymousClassQuery();
var result = vm.AnonymousClassMethod();
// Display Results
vm.Display(result);