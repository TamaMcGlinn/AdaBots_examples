with Adabots;

procedure roman is
   Bot : constant Adabots.Turtle := Adabots.Create_Turtle;
begin
   loop
      -- if left is a wall, try forward
      Bot.Turn_Left;
      loop
         exit when not Bot.Detect;
         Bot.Turn_Right;
      end loop;
      Bot.Forward;
   end loop;
end roman;
