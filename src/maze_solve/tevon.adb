with Adabots;

procedure tevon is
   Bot : constant Adabots.Turtle := Adabots.Create_Turtle;
begin
   loop
      Bot.Turn_Left;
      if not Bot.Forward then
         Bot.turn_Right;
         if not bot.forward then
            bot.turn_Right;
            if not bot.forward then
               bot.turn_right;
            end if;
         end if;
      end if;
   end loop;
end tevon;
