with Adabots;

procedure Dig_Cavern is
   Bot : constant Adabots.Turtle := Adabots.Create_Turtle;

   procedure Dig_All is
   begin
      loop
         exit when not Bot.Dig;
      end loop;
      Bot.Maybe_Dig_Up;
      Bot.Maybe_Dig_Down;
   end Dig_All;

begin

   -- for Depth in 1 .. 15 loop
   --    Bot.Maybe_Dig_Down;
   --    Bot.Down;
   --    loop
   --       exit when not Bot.Dig;
   --    end loop;
   --    Bot.Forward;
   --    Bot.Maybe_Dig;
   --    Bot.Maybe_Dig_Up;
   -- end loop;

   -- Bot.Forward;

   for Width in 1 .. 8 loop
      for Length in 1 .. 15 loop
         Dig_All;
         Bot.Forward;
      end loop;
      if Width mod 2 = 0 then
         Bot.Turn_Left;
      else
         Bot.Turn_Right;
      end if;
      Dig_All;
      Bot.Forward;
      if Width mod 2 = 0 then
         Bot.Turn_Left;
      else
         Bot.Turn_Right;
      end if;
      Dig_All;
   end loop;

   -- come back up
   Bot.Up;
   loop
      exit when not Bot.Dig_Up;
      Bot.Up;
   end loop;
   for Heigh in 1 .. 3 loop
      Bot.Up;
   end loop;

   -- go to ground
   Bot.Forward;
   loop
      exit when Bot.Dig_Down;
      Bot.Down;
   end loop;

end Dig_Cavern;
