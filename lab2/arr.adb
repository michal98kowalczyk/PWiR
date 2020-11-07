with Ada.Text_IO, Ada.Numerics.Discrete_Random;
use Ada.Text_IO;

package body Arr is

    procedure Print (Arr:Integer_Arr) is
    begin
        for I in Arr'First .. Arr'Last loop
           Put_Line ("Arr(" & I'Img & ") = " & Arr(I)'Img);
        end loop;
       
    end Print;

    procedure Put_Randomized_Int (Arr: out Integer_Arr ) is

      package Los is new Ada.Numerics.Discrete_Random(Integer);
      use Los;
  
   
      Gen: Generator; 

    begin
    Reset(Gen);
    for I in Arr'First .. Arr'Last loop
       Arr(I) := Random(Gen);
       Put_Line("Arr("&I'Img & " ) = " & Arr(I)'Img);
    end loop;
       
    end Put_Randomized_Int;

   procedure Sort (Arr : in out Integer_Arr) is
     Tmp:Integer;
   begin

   if Arr'Length > 1 then
      for I in Arr'First .. Arr'Last loop
         for J in I .. Arr'Last loop
            if(Arr (I) > Arr (J)) then
               Tmp := Arr (I);
               Arr (I):= Arr (J);
               Arr (J):= Arr (I);
            end if;

            
         end loop;
         
      end loop;
      end if;
   end Sort;


   function Is_Sorted (Arr:in Integer_Arr) return Boolean is
      
   begin
      return (for all I in Arr'First .. (Arr'Last-1) => Arr(I+1) >= Arr(I));
      
   end Is_Sorted;

end Arr;