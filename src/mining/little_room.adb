with Adabots;

procedure little_room is
   Bot : constant Adabots.Turtle := Adabots.Create_Turtle;

   procedure Cell is
   begin
      bot.maybe_dig;
      bot.forward;
      bot.maybe_dig_up;
      bot.maybe_dig_down;
   end Cell;
begin

   bot.turn_left;
   cell;
   bot.turn_right;
   cell;
   bot.turn_right;
   cell;
   cell;
   bot.turn_right;
   cell;
   bot.back;
   bot.turn_right;
   bot.turn_right;
   cell;
   cell;
   cell;
   bot.turn_left;
   cell;
   bot.turn_left;
   cell;
   cell;
   bot.turn_left;
   cell;
   bot.turn_right;
   cell;
   cell;




end little_room;
