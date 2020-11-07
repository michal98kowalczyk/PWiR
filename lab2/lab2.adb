with Ada.Text_IO, Ada.Integer_Text_IO, Arr;
use Ada.Text_IO, Ada.Integer_Text_IO, Arr;

procedure Lab2  is
   A : Arr.Integer_Arr := (1..10 => 0);
  
begin
   Arr.Print(A);
   Arr.Put_Randomized_Int(A);
 
   Arr.Print(A);

   Put_Line(Arr.Is_Sorted(A)'Img);
   Arr.Sort(A);
   Put_Line(Arr.Is_Sorted(A)'Img);
   Arr.Print(A);



end Lab2;