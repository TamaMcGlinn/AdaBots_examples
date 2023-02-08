with Adabots;

procedure david is
   Bot : constant Adabots.Turtle := Adabots.Create_Turtle;
begin
   loop
      bot.Turn_Left;
      if bot.detect then
         bot.turn_right;
         if not bot.forward then
            bot.turn_right;
            if not bot.forward then
               bot.turn_right;
               bot.forward;
            end if;
         end if;
      else
         bot.forward;
      end if;
   end loop;
end david;
