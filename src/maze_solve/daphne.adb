with Adabots;

procedure daphne is
   Bot : constant Adabots.Turtle := Adabots.Create_Turtle;
begin
   Bot.Dig_Down;
   bot.Down;
   for steps in 1 .. 10 loop
      bot.dig;
      bot.Forward;
   end loop;

   bot.up;

end daphne;
