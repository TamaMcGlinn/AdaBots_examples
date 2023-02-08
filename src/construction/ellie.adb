with Adabots;

procedure ellie is
   Bot : constant Adabots.Turtle := Adabots.Create_Turtle;
begin
   for I in 1 .. 10 loop
      if Bot.detect then
         bot.dig;
      end if;
      bot.forward;
      bot.dig_down;
      if bot.detect_up then
         bot.dig_up;
      end if;
      bot.down;
   end loop;
end ellie;
