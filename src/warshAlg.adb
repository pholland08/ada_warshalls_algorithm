

   procedure warshAlg (input_bmr : in out bmr) is
      begin
      for I in input_bmr'Range(1) loop
         for J in input_bmr'Range(2) loop
            if (input_bmr(J,I) = true) then
               for K in input_bmr'Range(1) loop
                  input_bmr(J,K) := input_bmr(J,K) or input_bmr(I,K);
               end Loop;
            end if;
         end loop;
      end loop;
      end;
   --comment