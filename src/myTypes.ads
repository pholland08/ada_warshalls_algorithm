--This is where the array types are initialized for use in other files

package myTypes is

   type intArray is array (Integer range <>) of Integer;
   type charArray is array (Integer range <>) of Character;
   type bmr is array(Integer range <>, Integer range <>) of Boolean
     with Default_Component_Value => False;
   type int_bmr is array(Integer range <>, Integer range <>) of Integer range 0..1
     with Default_Component_Value => 0;
   type namedBmr is array
     (Character range <>, Character range <>) of Integer
     with Default_Component_Value => 0;


end myTypes;
