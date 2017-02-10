--This is where the array types are initialized for use in other files

package arrays is

   type intArray is array (Integer range <>) of Integer;
   type charArray is array (Integer range <>) of Character;
   type bmr is array(Integer range <>, Integer range <>) of Boolean
     with Default_Component_Value => False;
   type int_Bmr is array
     (Integer range <>, Integer range <>) of Integer
     with Default_Component_Value => 0;


end arrays;
