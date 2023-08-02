with Adabots;

procedure forward is
   Bot : constant Adabots.Turtle := Adabots.Create_Turtle;
begin
   loop
      exit when not Bot.Forward;
   end loop;
end forward;
