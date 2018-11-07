
--------------------------------------------------------------------------------
----------------------------- Main procedure------------------------------------
--------------------------------------------------------------------------------
with Ada.Text_IO; use Ada.Text_IO;
with generic_warshaws;

procedure Main is

-------------------------- Boolean package overloads----------------------------
   ---- IO procedure to pass for booleans
   procedure boolean_put(out_file : File_Type; x : Boolean) is
      output : integer := 0;
   begin
      if x then
         output := 1;
      end if;
      Put(out_file, output'Image&"   ");
   end;

   ---- "or" operator overload for booleans
   function boolean_or(left, right: Boolean) return Boolean is
   begin
      if right then
         return right;
      else
         return left;
      end if;
   end;

-------------------------- Integer package overloads----------------------------
   ---- IO procedure to pass for integers
   procedure integer_put(out_file : File_Type; x : Integer) is
   begin
      Ada.Text_IO.Put(out_file, x'Image&"   ");
   end;

   ---- "or" operator overload for integers
   function integer_or(left, right: Integer) return Integer is
   begin
      if Left+Right > 0 then
         return 1;
      else
         return 0;
      end if;
   end;

---------------------- Boolean package initialization---------------------------
   package boolean_war_pac is new generic_warshaws(my_type => Boolean,
                                                   default => False,
                                                   affirmative => True,
                                                   Put     => boolean_put,
                                                   "or"    => boolean_or);
   use boolean_war_pac;

--------------------- Integer package initialization----------------------------
   package integer_war_pac is new generic_warshaws(my_type => Integer,
                                                   default => 0,
                                                   affirmative => 1,
                                                   Put     => integer_put,
                                                   "or"    => integer_or);
   use integer_war_pac;

--------------------------------------------------------------------------------
--------------------------- Begin main procedure--------------------------------
--------------------------------------------------------------------------------
begin
   ---- Run each input file and output the results
   boolean_war_pac.run(input_path => "C_Input.txt",
                       output_path => "C_Output.txt");

   integer_war_pac.run(input_path => "B_Input.txt",
                       output_path => "B_Output.txt");

   integer_war_pac.run(input_path => "A1_Input.txt",
                       output_path => "A1_Output.txt");

   integer_war_pac.run(input_path => "A2_Input.txt",
                       output_path => "A2_Output.txt");

--------------------------- End main procedure----------------------------------
end Main;


