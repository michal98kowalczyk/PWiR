with Ada.Text_IO;  use Ada.Text_IO;
-- With Gnat.IO; use Gnat.IO;

procedure Main is

    ---------
    type BoardRange is range 1 .. 3;
    type BoardType is array (BoardRange, BoardRange) of Character;

    Board : BoardType := (('B', 'b', 'b'), ('a', 'a', 'a'), ('c', 'c', 'c'));

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
                Put_Line("-----------");
               end if;
            end loop;
    end ShowBoard;

begin
    Ada.Text_IO.Put_Line ("Hello world!");
    -- Ada.Text_IO.Put_Line (Board(1,1));
    -- Put(Board(1,1));
    ShowBoard(Board);
end Main;
