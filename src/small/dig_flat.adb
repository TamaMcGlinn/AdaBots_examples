with Adabots;

procedure dig_flat is
   Bot : constant Adabots.Turtle := Adabots.Create_Turtle;
begin
   for Y in 1 .. 30 loop
      for I in 1 .. 16 loop
         bot.Maybe_Dig;
         bot.Maybe_Dig_Down;
         Bot.Forward;
      end loop;
      for I in 1 .. 16 loop
         bot.back;
      end loop;
      bot.turn_right;
      bot.forward;
      bot.turn_left;
   end loop;
end dig_flat;
