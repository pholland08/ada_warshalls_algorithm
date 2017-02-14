
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
--with warshAlg_bool;
with warshAlg_int;
with int_or; use int_or;
with myProcs; use myProcs;
with myTypes; use myTypes;
--include dependencies


procedure Main is
   allNodes : Integer;
   --declare variables

begin
   --prompt user for input
   Put_Line("How many nodes?");
   allNodes := Integer'Value(Get_Line);
   Put_Line(allNodes'Image&" nodes");

   --convert to desired data type


   --allocate memory for array based on input
   declare
      allNodeNames : charArray(1..allNodes);
      myBmr : int_Bmr(1..allNodes, 1..allNodes);
   begin

      for i in 1..allNodes loop
         Put_Line("Enter name for node"&i'image);
         allNodeNames(i) := Get_Line(1);
         Put_Line("Node"&i'image&" => "&allNodeNames(i));
      end loop;


      for i in 1..allNodes loop
         for j in 1..allNodes loop
            if i = j then
               --myBmr(i,j) := 0;
               goto Continue;
            end if;

            Put_Line("Enter true or false: can "& allNodeNames(i) &" talk to "& allNodeNames(j) &"?");

            if Get_Line = "1" then
               myBmr(i,j) := 1;
            end if;

            Put_Line(allNodeNames(i) &" => "& allNodeNames(j)&": "&myBmr(i,j)'Image);

            <<Continue>>
         end loop;
      end loop;

      Put("  ");

      for i in allNodeNames'Range loop
         Put(allNodeNames(i)&" ");
      end loop;
      Put_Line("");
      for row in myBmr'Range(1) loop
         Put(allNodeNames(row)&"");

         for column in myBmr'Range(2) loop
            if myBmr(row,column)=1 then
               Put(myBmr(row,column)'Image&"");
            else
               Put(myBmr(row,column)'Image&"");
            end if;
         end loop;

         Put_Line("");
      end loop;

      warshAlg_int(myBmr);
      Put_Line("");
      Put("  ");

      for i in allNodeNames'Range loop
         Put(allNodeNames(i)&" ");
      end loop;
      Put_Line("");
      for row in myBmr'Range(1) loop
         Put(allNodeNames(row)&"");

         for column in myBmr'Range(2) loop
            if myBmr(row,column) = 1 then
               Put(myBmr(row,column)'Image&"");
            else
               Put(myBmr(row,column)'Image&"");
            end if;
         end loop;

         Put_Line("");
      end loop;

   end;


   --print each transaction as it's processed


end Main;

--this is a comment to show github seeing updates
