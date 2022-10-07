using LINQSamples;

// Create instance of view model
SamplesViewModel vm = new();

// Call Sample Method
//var result = vm.TakeQuery();
//var result = vm.TakeMethod();
//var result = vm.TakeRangeMethod();
//var result = vm.TakeWhileMethod();
//var result = vm.SkipQuery();
//var result = vm.SkipWhileMethod();
var result = vm.ChunkQuery();

// Display Results
vm.Display(result);