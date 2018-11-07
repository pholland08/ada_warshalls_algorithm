with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Text_IO.Unbounded_IO; use Ada.Text_IO.Unbounded_IO;

generic
   type my_type is (<>);
   default, affirmative : my_type;
   with procedure Put (file_name: File_Type; T : my_type);
   with function "or" (left, right : my_type) return my_type;

package generic_warshaws is
   type boolean_matrix is array(Positive range <>,
                                Positive range <>) of my_type;
   procedure run(input_path, output_path : String);
   procedure warshaws_algorithm (bmr : in out boolean_matrix;
                                 affirmative : in my_type);

end generic_warshaws;
