with Adabots;

procedure anthony is
   Bot : constant Adabots.Turtle := Adabots.Create_Turtle;
begin
   loop
      bot.turn_right;
      while not bot.forward loop
         bot.turn_left;
      end loop;
   end loop;

end anthony;
