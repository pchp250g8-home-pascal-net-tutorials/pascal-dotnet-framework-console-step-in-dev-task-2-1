begin
  var a : Cardinal; // lower limit of safe readings
  var b : Cardinal; // upper limit of safe readings
  var n : Cardinal; // interference level value
  var c : Cardinal = 0; // counter for safe readings
  // Variable to store the length of the segment where readings are safe. 
  var d : Cardinal = 0; 
  var m : Cardinal; // local maximum length of the safe reading segment
  var max_len = 0; // final maximum of the length of the safe reading segment
  // Data input
  Console.WriteLine('Enter the safety limits for readings'); 
  Console.Write('Lower limit: '); 
  Cardinal.TryParse(Console.ReadLine(), a); 
  Console.Write('Upper limit: '); 
  Cardinal.TryParse(Console.ReadLine(), b); 
  Console.WriteLine('Enter orbital station sensor readings'); 
  Console.WriteLine('0 - end data input'); 
  // Input the first interference level value
  Cardinal.TryParse(Console.ReadLine(), n); 
  // Input readings until the value is 0.
  while (n <> 0) do
  begin
    if ((n >= a) and (n <= b)) // condition for safe readings
    then
      c += 1 // Increment safe readings counter
    else
    begin
      d := c; // If readings are unsafe, store the count of safe ones
      c := 0; // and reset the counter. 
    end; 
    {determine the maximum length of the segment
    where readings are safe. If the counter was reset
    (the chain of safe data was interrupted), then the maximum length
    is the old counter value (variable "d"). 
    Otherwise, it is the current (new) counter value (variable "c").
    Intermediate result.}
    if (d > c) then
      m := d
    else
      m := c; 
    {Final maximum length of the segment
     where readings are safe.}
    if (m > max_len) then
      max_len := m;
    Cardinal.TryParse(Console.ReadLine(), n); // input next data point
  end;
  // Displaying information on the screen. 
  Console.WriteLine($'Length of the interval where all readings are safe: {m}'); 
  Console.Read(); // Pause screen output until the "Enter" key is pressed
end.