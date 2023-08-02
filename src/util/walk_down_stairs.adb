with Adabots;

procedure walk_down_stairs is
   Bot : constant Adabots.Turtle := Adabots.Create_Turtle;
begin
   loop
      exit when not Bot.Forward;
      exit when not Bot.Down;
   end loop;
end walk_down_stairs;
