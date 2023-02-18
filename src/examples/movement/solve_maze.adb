with Adabots;

procedure solve_maze is
   Bot : constant Adabots.Turtle := Adabots.Create_Turtle (7113);
begin
   loop
      Bot.Turn_Left;
      if Bot.Detect then
         Bot.Turn_Right;
         if not Bot.Forward then
            Bot.Turn_Right;
            if not Bot.Forward then
               Bot.Turn_Right;
               Bot.Forward; -- will raise error if Bot is completely surrounded
            end if;
         end if;
      else
         Bot.Forward;
      end if;
   end loop;
end solve_maze;
