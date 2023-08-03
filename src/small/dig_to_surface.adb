with Adabots;

procedure dig_to_surface is
   Bot : constant Adabots.Turtle := Adabots.Create_Turtle;
begin
   loop
      exit when not bot.detect_up;
      bot.dig_up;
      bot.up;
   end loop;
   bot.up;
   for i in 1 .. 10 loop
      bot.up;
      if not bot.detect then
         bot.place;
      end if;
   end loop;
end dig_to_surface;
