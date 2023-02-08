with Adabots;

procedure ivan is
   Bot : constant Adabots.Turtle := Adabots.Create_Turtle;
begin
   loop
      bot.turn_right;
      if bot.detect then
         bot.turn_left;
         if not bot.forward then
            bot.turn_left;
            if not bot.forward then
               bot.turn_left;
               bot.forward;
            end if;
         end if;
      else
         bot.forward;
      end if;
   end loop;
end ivan;
