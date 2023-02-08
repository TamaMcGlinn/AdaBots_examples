with Adabots;

procedure jesse is
   Bot : constant Adabots.Turtle := Adabots.Create_Turtle;
begin
   loop
      bot.turn_left;
      while bot.detect loop
         bot.turn_right;
      end loop;
      bot.forward;
   end loop;
end jesse;
