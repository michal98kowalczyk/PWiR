-- lab1.adb
-- komentarz do koĹca linii

-- wykorzystany pakiet 
with Ada.Text_IO;
use Ada.Text_IO;

-- procedura gĹĂłwna - dowolna nazwa
procedure Lab1 is

-- czÄĹÄ deklaracyjna  
  
  -- funkcja - forma peĹna
  function Max2(A1, A2 : in Float ) return Float is
  begin
    if A1 > A2 then return A1;
    else return A2; 
    end if;
  end Max2;    

  -- funkcja "wyraĹźeniowa"  
  -- forma uproszczona funkcji
  -- jej treĹciÄ jest tylko wyraĹźenie w nawiasie   
  
  function Add(A1, A2 : Float) return Float is
    (A1 + A2);
       
  function Max(A1, A2 : in Float ) return Float is
    (if A1 > A2 then A1 else A2);    
    
  -- Fibonacci      
  function Fibo(N : Natural) return Natural is   
    (if N = 0 then 1 elsif N in 1|2 then  1 else Fibo(N-1) + Fibo(N-2) );

  --Average
  function Avg(A1, A2 : Float) return Float is ((A1+A2)/2.0);
  
  --Factorial
  function Factorial(N : Long_Integer) return Long_Integer is 
  begin
    if N=0 then
      return 1 ;
    else 
      return N*Factorial(N-1);
     
    end if;
  end Factorial;
    -- procedura 
    -- zparametryzowany ciÄg instrukcji  
  procedure Print_Fibo(N: Integer) is
  begin
    if N <1 or N>46 then raise Constraint_Error;
    end if;
    Put_Line("CiÄg Fibonacciego dla N= " & N'Img);
    for I in 1..N loop
      Put( Fibo(I)'Img & " " );
    end loop;   
    New_Line;
  end Print_Fibo;    
   
-- poniĹźej treĹÄ procesury gĹĂłwnej   
begin
  Put_Line("Suma = " & Add(3.0, 4.0)'Img ); 
  Put_Line( "Max =" & Max(6.7, 8.9)'Img);
  Put_Line( "Max2 =" & Max2(6.7, 8.9)'Img);
  Print_Fibo(12);

  Put_Line("Srednia = " & Avg(4.0,6.0)'Img);
  Put_Line("Silnia = " & Factorial(8)'Img);
end Lab1;  