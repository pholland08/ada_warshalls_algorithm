package body myProcs is

   procedure printArray(allNodeNames : charArray; myBmr : bmr) is

   begin
      for i in allNodeNames'Range loop
         Put(allNodeNames(i)&"      ");
      end loop;
      Put_Line("");
      for row in myBmr'Range(1) loop
         Put(allNodeNames(row)&" ");
         for column in myBmr'Range(2) loop
            if myBmr(row,column) then
               Put(myBmr(row,column)'Image&"   ");
            else
               Put(myBmr(row,column)'Image&"  ");
            end if;
         end loop;
         Put_Line("");
      end loop;
   end printArray;

   end myProcs;
