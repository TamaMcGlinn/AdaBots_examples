with Adabots;

procedure solve_maze is
   Bot : constant Adabots.Turtle := Adabots.Create_Turtle;
begin
   loop
      bot.Turn_left;
      loop
         exit when not bot.Detect;
         bot.Turn_right;
      end loop;
      bot.forward;
   end loop;
end solve_maze;
