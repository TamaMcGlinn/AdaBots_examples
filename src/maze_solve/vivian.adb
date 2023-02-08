with Adabots;

procedure vivian is
   Bot : constant Adabots.Turtle := Adabots.Create_Turtle (7113);
begin
   for Index in 1..2 loop
      bot.turn_Left;
   end loop;
   for Index in 1..2 loop
      bot.Forward;
   end loop;

end vivian;
