with Adabots;

procedure ansun is
   Bot : constant Adabots.Turtle := Adabots.Create_Turtle;
begin
   bot.up;
   for I in 1 .. 4 loop
      bot.place_down;
      bot.forward;
      bot.turn_right;
   end loop;
   bot.back;
   bot.turn_right;
   bot.back;
   for I in 1 .. 3 loop
      bot.place_down;
      bot.forward;
   end loop;
   bot.turn_left;
   for I in 1 .. 3 loop
      bot.place_down;
      bot.forward;
   end loop;
   bot.turn_left;
   for I in 1 .. 3 loop
      bot.place_down;
      bot.forward;
   end loop;
   bot.turn_left;
   for I in 1 .. 3 loop
      bot.place_down;
      bot.forward;
   end loop;
   bot.turn_left;
end ansun;
