with Adabots;

procedure bridge is
   bot : constant Adabots.Turtle := Adabots.Create_Turtle;
begin
   loop
      exit when bot.detect;
      bot.forward;
      bot.place_down;
      bot.turn_right;
      bot.place;
      bot.turn_right;
      bot.turn_right;
      bot.place;
      bot.turn_right;
   end loop;
end bridge;
