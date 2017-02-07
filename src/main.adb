
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with arrays; use arrays;
--include dependencies


procedure Main is
   allNodes : Integer;
   --declare variables

begin
   --prompt user for input
   Put_Line("How many nodes?");
   allNodes := Integer'Value(Get_Line);

   --convert to desired data type
   Put_Line("So there are" & allNodes'Image & " total nodes in the system?");

   --allocate memory for array based on input
   declare
      myBmr : bmr(1..allNodes);
      boolVal : Boolean;
   begin
      for i in 1..allNodes loop
         for j in 1..allNodes loop
            if i = j then
               goto Continue;
            end if;

            Put_Line("Enter true or false: can"& i'Image &" talk to"& j'Image &"?");

            if Get_Line = "true" then
               boolVal := True;
            else
               boolVal := False;
            end if;

            myBmr(i,j) := boolVal;
            if myBmr(i,j) then
               Put_Line("true");
            else
               Put_Line("false");
            end if;

            <<Continue>>
         end loop;
      end loop;


      for i in myBmr'Range loop
         Put(i);
      end loop;

      for i : arrays in myBmr loop
         for j in i'Length loop
            Put_Line(i);
            Put_Line("");
            end loop;
      end loop;

   end;


   --print each transaction as it's processed


end Main;

