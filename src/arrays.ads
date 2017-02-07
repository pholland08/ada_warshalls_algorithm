--This is where the array types are initialized for use in other files

package arrays is

   type intArray is array (Integer range <>) of Integer;
   type charArray is array (Integer range <>) of Character;
   type bmr is array (Integer range <>) of Boolean;

end arrays;
