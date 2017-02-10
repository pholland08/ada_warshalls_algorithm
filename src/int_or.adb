package body int_or is

   function "or" (Left, Right : Integer) return Integer is
      sum : integer := Left+Right;

   begin

      if sum > 0 then
         return 1;
      else
         return 0;
      end if;
   end;
end int_or;
