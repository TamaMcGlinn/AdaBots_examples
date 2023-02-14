with Adabots;

procedure staircase_up is
   Bot : constant Adabots.Turtle := Adabots.Create_Turtle;
begin
   while bot.detect_up loop
      bot.maybe_dig;
      bot.forward;
      bot.maybe_dig_down;
      bot.maybe_dig_up;
      bot.up;
   end loop;
   bot.maybe_dig;
   bot.forward;
   bot.maybe_dig_down;
   bot.maybe_dig;
   bot.up;
   bot.up;
   bot.up;
end staircase_up;
