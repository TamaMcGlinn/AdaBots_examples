with Adabots;

procedure jonathan2 is
   Bot : constant Adabots.Turtle := Adabots.Create_Turtle;
begin
   loop
      if bot.Detect_Right then
         if bot.Detect then
            bot.turn_left;
         else
            bot.forward;
         end if;
      else
         bot.Turn_Right;
         bot.forward;
      end if;
   end loop;
end jonathan2;
