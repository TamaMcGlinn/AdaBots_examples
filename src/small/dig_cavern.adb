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

end Dig_Cavern;
