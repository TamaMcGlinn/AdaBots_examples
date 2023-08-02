with Adabots;

procedure Move is
   Bot : constant Adabots.Turtle := Adabots.Create_Turtle;
begin
   bot.turn_left;
   for D in 1 .. 8 loop
      Bot.Forward;
   end loop;
   bot.turn_left;
   for D in 1 .. 8 loop
      Bot.Forward;
   end loop;
end Move;
