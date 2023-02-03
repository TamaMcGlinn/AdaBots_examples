with Adabots;

-- builds a 6x6 house
-- needs at least 43 blocks in slot 1 for the walls
-- and 48 blocks in slot 2 for the roof
procedure build_house is
   Bot : constant Adabots.Turtle := Adabots.Create_Turtle;
begin
   -- select wall material
   Bot.Select_Slot (1);

   --  Go to floor
   loop
      exit when Bot.Down = False;
   end loop;
   -- get off floor
   Bot.Up;

   -- build each wall moving backward
   for Wall in 1 .. 4 loop
      Bot.Turn_Left;
      for I in 1 .. 5 loop
         Bot.Place_Up;
         if not (Wall = 1 and I = 3) then
            Bot.Place_Down;
         end if;
         if Wall = 4 and I = 5 then
            -- this is the very last wall, and our back is up against
            -- the first wall, so Bot.Back won't work, unless we turn right
            Bot.Turn_Right;
         end if;
         Bot.Back;
         if not (Wall = 1 and I = 3) then
            Bot.Place;
         end if;
      end loop;
   end loop;

   -- select roof material
   Bot.Select_Slot (2);

   -- move up to be above the wall
   Bot.Up;
   Bot.Up;

   -- align with the corner
   Bot.Turn_Right;
   Bot.Forward;
   Bot.Turn_Right;

   -- build a slanted roof over the top
   for H in 1 .. 6 loop
      for I in 1 .. 8 loop
         Bot.Back;
         Bot.Place;
      end loop;
      --floating behind first line
      Bot.Up;
      for I in 1 .. 8 loop
         Bot.Forward;
      end loop;
      Bot.Turn_Right;
      Bot.Forward;
      Bot.Turn_Left;

      if H = 3 then
         Bot.Down;
      end if;
      if H > 3 then
         Bot.Down;
         Bot.Down;
      end if;
   end loop;
end build_house;
