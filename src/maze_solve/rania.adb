with Adabots;

procedure rania is
   Bot : constant Adabots.Turtle := Adabots.Create_Turtle;
begin
   loop
      bot.turn_right;
      while bot.detect loop
         bot.turn_left;
      end loop;
      bot.forward;
   end loop;
end rania;
