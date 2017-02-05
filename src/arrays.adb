
with Ada.Text_IO; use Ada.Text_IO;
--with & use the arrays.ads package
with arrays; use arrays;


procedure Main is

 --array types declared in arrays.ads
 intArr : intArray(1..3) := (0,1,2);
 charArr : charArray(0..2) := ('a','b','c');

begin

   --if declaring a new variable after beginning the procedure, you have to
     --use a declare statement and another begin statement
   declare

      charIndex : Integer;
   begin
      -- Use 'range to get the range of an array
      for I in intArr'Range loop
         charIndex:=intArr(i);
         --Ada deals with char and int in a weird way so to print
           --them you have to use 'image
         Put_Line (charArr(charIndex)'image);

      end loop;
   end;

end Main;

