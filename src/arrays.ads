--This is where the array types are initialized for use in other files

package arrays is

   type intArray is array (Integer range <>) of Integer;
   type charArray is array (Integer range <>) of Character;
   type bmr is array
     (Integer range <>, Integer range <>) of Integer
     with Default_Component_Value => 0;
   type namedBmr is array
     (Character range <>, Character range <>) of Integer
     with Default_Component_Value => 0;


end arrays;
