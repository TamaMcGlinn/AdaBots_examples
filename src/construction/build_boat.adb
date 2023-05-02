with Adabots;

procedure build_boat is
   Bot : constant Adabots.Turtle := Adabots.Create_Turtle;

   procedure Bottom is
   begin
      bot.Select_Slot(2);
      for d in 1 .. 4 loop
         for s in 1..5 loop
            bot.back;
            Bot.place;
         end loop;
         bot.turn_left;
         bot.back;
         bot.turn_left;
         bot.back;
         for s in 1..5 loop
            bot.back;
            Bot.place;
         end loop;
         bot.turn_right;
         bot.back;
         bot.turn_right;
         bot.back;
      end loop;
   end Bottom;

   procedure Mast is
   begin
      bot.up;
      bot.turn_left;
      bot.forward;
      bot.forward;
      bot.forward;
      bot.forward;
      bot.turn_left;
      bot.forward;
      for o in 1..4 loop
         bot.place;
         bot.up;
      end loop;
      bot.down;
   end Mast;

   procedure Flag is
   begin
      bot.turn_left;
      bot.forward;
      bot.turn_right;
      bot.forward;
      bot.forward;
      bot.Turn_Right;
      -- wool for flag
      bot.Select_Slot(1);
      for w in 1..2 loop
         bot.place;
         bot.down;
      end loop;
      bot.up;
      bot.turn_left;
      bot.forward;
      bot.turn_right;
      for j in 1..2 loop
         bot.place;
         bot.up;
      end loop;
      bot.down;
      bot.turn_left;
      bot.forward;
      bot.turn_right;
      for u in 1..2 loop
         bot.place;
         bot.down;
      end loop;
   end Flag;

   procedure Go_To_Sea is
   begin
      bot.turn_left;
      for b in 1 .. 8 loop
         bot.forward;
      end loop;
      while not bot.detect_down loop
         bot.down;
      end loop;
      bot.down;
      bot.turn_left;
      bot.turn_left;
   end Go_To_Sea;

begin
   for I in 1..10 loop
      Bottom;
      Mast;
      Flag;
      Go_To_Sea;
   end loop;
end build_boat;
