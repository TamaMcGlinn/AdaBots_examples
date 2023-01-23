with Adabots;

procedure Nod is
   Bot : constant Adabots.Turtle := Adabots.Create_Turtle;
begin

   for I in 1 .. 3 loop
      Bot.Turn_Left;
      Bot.Turn_Right;
   end loop;

end Nod;
