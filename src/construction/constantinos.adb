with Adabots;

procedure constantinos is
   Bot : constant Adabots.Turtle := Adabots.Create_Turtle;
begin
   Bot.Forward;
   while not Bot.Detect_Down loop
      Bot.Down;
   end loop;

   -- loop
   --    Bot.Up;
   --    Bot.Forward;
   --    Bot.Place_Down;
   -- end loop;
end constantinos;
