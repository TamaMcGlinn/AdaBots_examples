with Adabots;

procedure jonathan is
   Bot : constant Adabots.Turtle := Adabots.Create_Turtle;
begin
   bot.forward;
   bot.turn_right;
   for D in 1 .. 6 loop
      bot.forward;
   end loop;
   bot.turn_left;

   bot.forward;
   bot.forward;

   bot.turn_left;

   bot.forward;
   bot.forward;

   bot.turn_right;

   bot.forward;
   bot.forward;

   bot.turn_right;

   bot.forward;
   bot.forward;

   bot.turn_left;

   for D in 1 .. 5 loop
      bot.forward;
   end loop;
end jonathan;
