with Adabots;

procedure fernando is
   Bot : constant Adabots.Turtle := Adabots.Create_Turtle;
begin

   loop
      Bot.Turn_Right;
      while Bot.Detect loop
         Bot.Turn_Left;
      end loop;
      Bot.Forward;
   end loop;
end fernando;
