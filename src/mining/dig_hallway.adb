with Adabots;

procedure Dig_Hallway is
   Bot : constant Adabots.Turtle := Adabots.Create_Turtle;

   Length : constant := 8;

begin

   for D in 1 .. Length loop

      while Bot.Detect loop
         Bot.Dig;
      end loop;

      Bot.Forward;
      Bot.Maybe_Dig_Up;
      Bot.Maybe_Dig_Down;
   end loop;

end Dig_Hallway;
