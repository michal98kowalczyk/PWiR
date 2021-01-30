with Ada.Text_IO;  use Ada.Text_IO;
-- With Gnat.IO; use Gnat.IO;

procedure Main is

    ---------
    type BoardRange is range 1 .. 3;
    type BoardType is array (BoardRange, BoardRange) of Character;

    Board : BoardType := ((' ', ' ', ' '), (' ', ' ', ' '), (' ', ' ', ' '));

    currentMove : Character := 'x';
    isFinished : Boolean := False;
    movesCount : Integer := 0;
    playerSign : Character;




   ---------------

    procedure ShowBoard (Board : in BoardType  ) is
        begin
            for i in BoardRange loop
               for j in BoardRange loop

                  Put(Board(i,j));

                  if j /= 3 then  
                    Put(" | ");
                    end if;

               end loop;

               Put_Line("");

               if i /=3 then
                Put_Line("--+---+--");
               end if;
            end loop;
    end ShowBoard;

    -----------------------------

    ---------------
    task type monitor is
        entry showScreen;
        entry showWinner(result : String);
    
    end monitor;

    task body monitor is
       
    begin
        loop
           select 
            accept showScreen do
               ShowBoard(Board);
            end showScreen;
              
           or
            accept showWinner(result : in String) do
               Put_Line(result);
            end showWinner;

           or 
            terminate;
        
              
           end select;
        end loop;
       
    end monitor;

    mon : monitor;
 

task play;
task body play is
begin
    Ada.Text_IO.Put_Line ("Hello world!");
    New_Line;
    -- Ada.Text_IO.Put_Line (Board(1,1));
    -- Put(Board(1,1));

    Put_Line("Choose your sign, press 'x' or 'o' ");
    Get(playerSign);
    
    while playerSign /= 'x' and playerSign /='o' loop
        Put_Line("Wrong character, press 'x' or 'o' ");
        Get(playerSign);
       
    end loop;
    

    Put_Line("Your sign is " & playerSign);
    New_Line;

    ShowBoard(Board);
    
    

    mon.showScreen;
    mon.showWinner("Draw");
end play;

begin
    null;



end Main;
