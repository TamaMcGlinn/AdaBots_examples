with Adabots;

procedure edwin is
   Bot : constant Adabots.Turtle := Adabots.Create_Turtle (7113);
begin
   loop
      bot.turn_left;
      while not bot.forward loop
         bot.turn_right;
      end loop;
   end loop;
end edwin;
