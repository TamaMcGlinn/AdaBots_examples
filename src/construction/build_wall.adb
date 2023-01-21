with Adabots;

procedure Build_Wall is
   Bot : constant Adabots.Turtle := Adabots.Create_Turtle;
begin

   --  Go to floor
   loop
      exit when Bot.Down = False;
   end loop;

   --  One back up
   Bot.Up;

   --  Turn around
   Bot.Turn_Left;
   Bot.Turn_Left;

   --  Build wall backwards
   for Wall_Index in 1 .. 3 loop
      Bot.Place_Down;
      Bot.Place_Up;
      Bot.Back;
      Bot.Place;
   end loop;

   --  Turn around
   Bot.Turn_Left;
   Bot.Turn_Left;

end Build_Wall;
