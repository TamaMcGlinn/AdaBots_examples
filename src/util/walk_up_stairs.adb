with Adabots;

procedure Walk_Up_Stairs is
   Bot : constant Adabots.Turtle := Adabots.Create_Turtle;
begin
   loop
      while not Bot.Detect loop
         Bot.Forward;
      end loop;
      Bot.Up;
   end loop;
end Walk_Up_Stairs;
