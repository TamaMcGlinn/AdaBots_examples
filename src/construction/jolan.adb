with Adabots;

procedure jolan is
   Bot : constant Adabots.Turtle := Adabots.Create_Turtle;
begin
   bot.up;
   loop
      if not bot.detect_down then
         bot.down;
      end if;
      if bot.detect_down then
         bot.up;
      end if;
      bot.place_down;
      bot.place_up;
      bot.back;
      bot.place;
   end loop;
end jolan;
