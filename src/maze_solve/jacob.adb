with Adabots;

procedure jacob is
   Bot : constant Adabots.Turtle := Adabots.Create_Turtle;
begin
   Bot.down;
   Bot.Forward;
   Bot.turn_right;
   while not Bot.Detect loop
      Bot.Forward;
   end loop;

end jacob;
