with Adabots;

procedure serge is
   Bot : constant Adabots.Turtle := Adabots.Create_Turtle (7113);
begin
   loop
      Bot.Turn_Right;
      while Bot.Detect loop
         Bot.Turn_Left;
      end loop;
      Bot.Forward;
   end loop;

end serge;
