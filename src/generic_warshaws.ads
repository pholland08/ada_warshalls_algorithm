
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Text_IO.Unbounded_IO; use Ada.Text_IO.Unbounded_IO;

generic
   type data_type is private;
   type boolean_matrix is array
     (Positive range <>, Positive range <>) of data_type;
   type string_array is array (Positive range <>)
     of Ada.Strings.Unbounded.Unbounded_String;
   with function "or"(left, right: data_type) return data_type;
   with procedure put(x: data_type);
   input_path, output_path : String;


package generic_warshaws is
   node_count : integer;
   input_file, output_file : File_Type;

   procedure run_it;
   procedure warshawsAlgorithm (bmr : boolean_matrix);

end generic_warshaws;
