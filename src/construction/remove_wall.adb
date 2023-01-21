with Adabots;

procedure Remove_Wall is
   Bot : constant Adabots.Turtle := Adabots.Create_Turtle;
begin

   --  Turn around
   Bot.Turn_Left;
   Bot.Turn_Left;

   --  Destroy wall
   for Wall_Index in 1 .. 3 loop
      Bot.Dig;
      Bot.Forward;
      Bot.Dig_Up;
      Bot.Dig_Down;
   end loop;

   --  Turn around
   Bot.Turn_Left;
   Bot.Turn_Left;

end Remove_Wall;
