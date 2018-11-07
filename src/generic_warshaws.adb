
--------------------------------------------------------------------------------
----------------------- Generic Warshaws package--------------------------------
--------------------------------------------------------------------------------

package body generic_warshaws is

     package SU renames Ada.Strings.Unbounded;

--------------------------------------------------------------------------------
--------------- Procedure that will be called from main procedure---------------
--------------------------------------------------------------------------------

   procedure run(input_path, output_path : String) is
      node_count : integer;
      input_file, output_file : File_Type;
   begin

------------------------- Get input from file-----------------------------------
      Open(File => input_file, Mode => In_File, Name => input_path);
      Create(File => output_file, Mode => Out_File, Name => output_path);

      ---- Get size of matrix
      Put_Line(output_file,"How many nodes?");
      Node_Count := Integer'Value(Get_Line(input_file));
      Put_Line(output_file,Node_Count'Image);

---------- Create matrix and allocate memory for array based on input-----------
      declare

         nodeList : array(1..node_count) of su.Unbounded_String;
         bmr : boolean_matrix(1..node_count, 1..node_count);


      begin

         for i in 1..Node_Count loop
            Put_Line(output_file,"Enter name for node"&i'Image);
            nodeList(i) := SU.To_Unbounded_String(Get_Line(input_file));
            Put_Line(output_file, nodeList(i));
         end loop;

         ---- Loop to get input for which nodes communicate directly
         for i  in bmr'Range loop
            for j in bmr'Range(1) loop

               ---- Can nodeList(i) talk to nodeList(j)?
               Put_Line(output_file,
                        "Can "&nodeList(i) &"talk to "& nodeList(j) &"?");

               ---- Assign value of response to node
               if (my_type'value(Get_Line(input_file)) = affirmative) then
                  bmr(i,j) := affirmative;
               else
                  bmr(i,j) := default;
               end if;

               ---- Print the relation between nodeList(i) & nodeList(j)
               Put_Line(output_file,bmr(i,j)'Image);

            end loop;
         end loop;

---------------------- Print matrix before Warshaw's Algorithm------------------
         Put_Line(output_file,"Matrix before Warshaw's Algorithm is:");

         --print node names
         put(output_file,"     ");
         for i in nodeList'First..nodeList'Last loop
            put(output_file, nodeList(i)&"  ");
         end loop;

         New_Line(output_file);

         -- Print node name and boolean relation
         for i in bmr'First..bmr'Last loop
            put (output_file,nodeList(i)&" ");
            for j in bmr'First..bmr'Last loop
               put(output_file,bmr(i,j));
            end loop;
            New_Line(output_file);
         end loop;


------------------------ Perform Warshaw's Algorithm----------------------------
         warshaws_algorithm(bmr, affirmative);

         New_Line(output_file);

------------------- Print matrix after Warshaw's Algorithm----------------------
         Put_Line(output_file,"Matrix after Warshaw's Algorithm is:");

         ---- print node names
         put(output_file,"     ");
         for i in nodeList'First..nodeList'Last loop
            put(output_file, nodeList(i)&"  ");
         end loop;
         New_Line(output_file);

         ---- Print node name and communication values
         for i in bmr'First..bmr'Last loop
            put (output_file,nodeList(i)&" ");
            for j in bmr'First..bmr'Last loop
               put(output_file,bmr(i,j));
            end loop;
            New_Line(output_file);
         end loop;

      end;

------------------------ Close files and end procedure--------------------------
      Close(input_file);
      Close(output_file);
   end run;

--------------------------------------------------------------------------------
-------------------------- Warshaw's Algorithm----------------------------------
--------------------------------------------------------------------------------

   procedure warshaws_algorithm
     (bmr : in out boolean_matrix; affirmative : in my_type) is

   begin
      for I in bmr'Range(1) loop
         for J in bmr'Range(2) loop
            if (bmr(J,I) = affirmative) then
               for K in bmr'Range(1) loop
                  bmr(J,K) := bmr(J,K) or bmr(I,K);
               end Loop;
            end if;
         end loop;
      end loop;
---------------------- End Warshaws Algorithm procedure-------------------------
   end warshaws_algorithm;


---------------------------- End generic package--------------------------------
end generic_warshaws;
