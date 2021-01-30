with Ada.Text_IO;  use Ada.Text_IO;
with Ada.Numerics.Discrete_Random;


procedure Main is

    ---------
    -- type BoardRange is range 1 .. 3 ;
    type BoardType is array (1..3, 1..3) of Character;

    Board : BoardType := ((' ', ' ', ' '), (' ', ' ', ' '), (' ', ' ', ' '));

    currentMove : Character := 'x';
    isNotFinished : Boolean := True;
    movesCount : Integer := 0;
    playerSign : Character;
    computerSign : Character;
    winner : Character;

    subtype randRange is Integer range 1..3;
    package Rand_Int is new Ada.Numerics.Discrete_Random(randRange);
    use Rand_Int;
    Gen: Generator; 


    ---------------
    function char2int (c : Character) return Integer is
        
    begin
        return Character'Pos(c) - 48;
    end char2int;

   ---------------

    procedure ShowBoard (Board : in BoardType  ) is
        begin
        Put (ASCII.ESC & "[2J");
            for i in 1..3 loop
               for j in 1..3 loop

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
    procedure ChangeCurrentMove is
    begin  
        if currentMove = 'x' then 
            currentMove :='o';
        else currentMove := 'x';
        end if;
       
    end ChangeCurrentMove;

    -------------------------
    procedure ComputerMove  is
    
    Found : Boolean := False;
    Row, Column : Integer;
       
    begin
    reset(Gen);
       
       while not Found loop
        Row := random(Gen);
        Column := random(Gen);

        if Board(Row,Column) = ' ' then
            Found := True;
            Board(Row,Column) := computerSign;
        end if;

        
          
       end loop;
    
        movesCount := movesCount + 1;
       ChangeCurrentMove;
    end ComputerMove;
    
    ------------------
    procedure PlayerMove  is
    
    Tmp:Character;
    Row : Integer; 
    Column :Integer;
    isNotPossibleChoice : Boolean := True;
       
    begin
       Put_Line("Enter the line number: ");
       Get(Tmp);
    
       Row := char2int(Tmp);
       Put_Line("Enter the column number: ");
       Get(Tmp);
       Column := char2int(Tmp);
       


        while isNotPossibleChoice loop
           if  Row<1 or Row>3 or Column<1 or Column>3   then
                Put_Line("Enter the correct line number: ");
                Get(Tmp);
                Row := char2int(Tmp);
                Put_Line("Enter the correct column number: ");
                Get(Tmp);
                Column := char2int(Tmp);
            elsif Board(Row,Column) /= ' ' then                          ---other condition because otherwise program was exited
                Put_Line("Enter the correct line number: ");
                Get(Tmp);
                Row := char2int(Tmp);
                Put_Line("Enter the correct column number: ");
                Get(Tmp);
                Column := char2int(Tmp);
               
            else
                Board(Row,Column) := playerSign;
                isNotPossibleChoice := not isNotPossibleChoice;
                movesCount := movesCount + 1;
            end if;

           
        end loop;


       ChangeCurrentMove;
     
    end PlayerMove;


    -------------------------
    function findWinner (Board: in BoardType) return Character is 

    function checkLine (a,b,c : Character) return Boolean is
       
    begin
       return (a=b) and (b=c);
    end checkLine;
        

    begin

        for i in  1..3 loop
            if checkLine(Board(i,1),Board(i,2),Board(i,3)) then
                
                return Board(i,1);
            elsif checkLine(Board(1,i),Board(2,i),Board(3,i)) then
                
                return Board(1,i);
            end if;
           
            if checkLine(Board(1,1),Board(2,2),Board(3,3)) then
                
                return Board(1,1);
            elsif checkLine(Board(1,3),Board(2,2),Board(3,1)) then
               
                return Board(1,3);
            end if;

        end loop;

    return 'd';

    end findWinner;


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


task type Checker is
    entry Check;
end Checker;
task body Checker is

   
begin
    loop
        select
        accept Check do
           winner := findWinner(Board);
           if winner = playerSign then
                mon.showScreen;
                mon.showWinner("Congratulations. You win!!!");
                isNotFinished := False;
            elsif winner = computerSign then
                mon.showScreen;
                mon.showWinner("You lost!!!");
                isNotFinished := False;
            elsif winner = 'd' and movesCount = 9 then
                mon.showScreen;
                mon.showWinner("It's draw!");
                isNotFinished := False;
            end if;
        end Check;
       
    or
       terminate;
    end select;
    end loop;
   
   
end Checker;

check : Checker;


---------------

task play;
task body play is






begin
    Ada.Text_IO.Put_Line ("Tic-Tac-Toe!");
    New_Line;
    
    Put_Line("Choose your sign, press 'x' or 'o' ");
    Get(playerSign);
        
    while playerSign /= 'x' and playerSign /='o' loop
        Put_Line("Wrong character, press 'x' or 'o' ");
        Get(playerSign);
        
    end loop;
        

    Put_Line("Your sign is " & playerSign);
    New_Line;

    if playerSign = 'x' then
        computerSign := 'o';
    else computerSign := 'x';
    end if;
       

    if playerSign = currentMove then
        Put_Line("You start.");
    else 
        Put_Line("Computer starts.");
    end if;
       

    delay 0.5;
    while isNotFinished loop
       

        
        mon.showScreen;

        if currentMove = playerSign then
            playerMove;
            
  
        else 
            ComputerMove;
        end if;
            
        

        check.Check;
        
        
           
        
        delay 0.3;

    end loop;

    
        
    
end play;

begin
    null;



end Main;
