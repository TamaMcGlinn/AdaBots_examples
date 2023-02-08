with Adabots;

procedure woju is
   Bot : constant Adabots.Turtle := Adabots.Create_Turtle;
begin
   bot.up;
   for I in 1 .. 7 loop
      bot.Forward;
   end loop;

   bot.down;
   bot.turn_right;
   for i in 1 .. 6 loop
      bot.forward;
   end loop;
   bot.turn_left;
   bot.forward;
end woju;
