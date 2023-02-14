with Adabots;

procedure dig_round_cavern is
   Bot : constant Adabots.Turtle := Adabots.Create_Turtle;

   procedure Cell is
   begin
      bot.maybe_dig;
      bot.forward;
      bot.maybe_dig_up;
      bot.maybe_dig_down;
   end Cell;
begin
   for f in 1 .. 4 loop
      Cell;
   end loop;
   bot.back;
   bot.turn_left;
   Cell;
   bot.turn_left;
   Cell;
   Cell;
   bot.back;
   bot.turn_right;
   Cell;
   bot.turn_left;
   bot.turn_left;
   bot.forward;
   bot.forward;
   Cell;
   Cell;
   bot.back;
   bot.turn_left;
   Cell;
   bot.turn_right;
   bot.turn_right;
   bot.forward;
   Cell;
end dig_round_cavern;
