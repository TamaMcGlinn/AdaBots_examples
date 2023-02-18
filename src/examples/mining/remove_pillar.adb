with Adabots;

procedure remove_pillar is
   Bot : constant Adabots.Turtle := Adabots.Create_Turtle;
begin
   loop
      Bot.Dig;
      exit when not Bot.Down;
   end loop;
end remove_pillar;
