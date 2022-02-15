with Adabots.Single_Turtle;

procedure Build_Wall is
   package Bot renames Adabots.Single_Turtle;
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

end Build_Wall;
