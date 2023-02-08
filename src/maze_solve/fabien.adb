with Adabots;

procedure fabien is
   Bot : constant Adabots.Turtle := Adabots.Create_Turtle;

   type Turtle_Selection is range 0 .. Adabots.Turtle_Inventory_Slot'Last;

   type Letter is array (1 .. 5, 1 .. 5) of Turtle_Selection;

   A : constant Letter :=
      ((0, 1, 1, 0, 0),
   (1, 0, 0, 1, 0),
      (1, 0, 0, 1, 0),
   (1, 1, 1, 1, 0),
      (1, 0, 0, 1, 0));
   D : constant Letter :=
      ((1, 1, 1, 0, 0),
   (1, 0, 0, 1, 0),
      (1, 0, 0, 1, 0),
   (1, 0, 0, 1, 0),
      (1, 1, 1, 0, 0));
   Text : constant array (1 .. 3) of Letter := (A, D, A);
begin
   Bot.Up;

   for L in Text'Range (1) loop
      for X in reverse Letter'Range (1) loop
         for Y in Letter'Range (2) loop
            if Text (L) (X, Y) /= 0 then
               Bot.Select_Slot (Adabots.Turtle_Inventory_Slot(Text (L) (X, Y)));
               Bot.Place_Down;
            end if;
            Bot.Forward;
         end loop;
         Bot.Up;
         for Y in Letter'Range (2) loop
            Bot.Back;
         end loop;
      end loop;
      for Y in Letter'Range (2) loop
         Bot.Forward;
      end loop;
      while bot.Down loop null; end loop;
      bot.Up;
   end loop;

end fabien;
