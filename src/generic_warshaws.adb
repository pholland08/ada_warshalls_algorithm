
package body generic_warshaws is

   package SU renames Ada.Strings.Unbounded;

   procedure run_it is

   begin

      -- Get input from file
      Open(File => input_file, Mode => In_File, Name => input_path);
      Create(File => output_file, Mode => Out_File, Name => output_path);

      Put_Line(output_file,"How many nodes?");
      Node_Count := Integer'Value(Get_Line(input_file));
      Put_Line(output_file,Node_Count'Image);


      -- Create matrix
      --allocate memory for array based on input
      declare

         nodeList : string_array(1..node_count);
         bmr : boolean_matrix(1..node_count, 1..node_count);


      begin

         for i in 1..Node_Count loop
            Put_Line(output_file,"Enter name for node"&i'image);
            nodeList(i) := SU.To_Unbounded_String(Get_Line(input_file));
            Put_Line(output_file, nodeList(i));
         end loop;

         -- Loop to get input for which nodes communicate directly
         for i  in bmr'Range loop
            for j in bmr'Range(1) loop

               -- Can nodeList(i) talk to nodeList(j)?
               Put_Line(output_file,"Can "& nodeList(i) &" talk to "& nodeList(j) &"?");

               -- Assign value of response to node
               -- Note: All matrix values were initialized by default to False
               if (Get_Line(input_file) = affirmative) then
                  bmr(i,j) := affirmative;
               else
                  bmr(i,j) := default;
               end if;

               -- Print the relation between nodeList(i) & nodeList(j)
               Put_Line(output_file,bmr(i,j)'Image);

               <<Continue>>
            end loop;
         end loop;

         -- Print matrix before Warshaw's Algorithm
         Put_Line(output_file,"Matrix before Warshaw's Algorithm is:");

         --print node names
         put(output_file,"   ");
         printArrayOfStrings(nodeList);

         -- Print node name and communication values
         for i in bmr'First..bmr'Last loop
            put (outputFile,nodeList(i)&" ");
            for j in bmr'First..bmr'Last loop
               --------------------------printArrayOfIntegers(booleanMatrix'Range(i));
               put(output_file,bmr(i,j)'Image&" ");
            end loop;
            Put_Line(output_file,"");
         end loop;


         -- Perform Warshaw's Algorithm
         warshawsAlgorithm(bmr);
         Put_Line(output_file,"");
         -- Print matrix after Warshaw's Algorithm
         Put_Line(output_file,"Matrix after Warshaw's Algorithm is:");

         --print node names
         put(output_file,"   ");
         printArrayOfStrings(nodeList);

         -- Print node name and communication values
         for i in bmr'First..bmr'Last loop
            put (output_file,nodeList(i)&" ");
            for j in bmr'First..bmr'Last loop
               put(output_file,bmr(i,j)'Image&" ");
            end loop;
            Put_Line(output_file,"");
         end loop;

      end;


      Close(input_file);
      Close(output_file);
   end run_it;

   procedure warshawsAlgorithm (bmr : in out boolean_matrix) is


   begin
      Put_Line;
   end warshawsAlgorithm;

end generic_warshaws;