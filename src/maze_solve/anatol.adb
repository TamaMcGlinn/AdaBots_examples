with Adabots;

procedure anatol is
   Bot : constant Adabots.Turtle := Adabots.Create_Turtle;

   procedure Keep_Going is
   begin
      loop
         exit when not Bot.Forward;
      end loop;
   end Keep_Going;
begin
   for I in 1 .. 2 loop
      bot.Forward;
   end loop;

   bot.turn_right;

   Keep_Going;

   bot.turn_left;

   Keep_Going;

   bot.turn_left;

   Keep_Going;

   bot.turn_right;

   Keep_Going;
   bot.turn_right;
   Keep_Going;
   bot.turn_left;
   Keep_Going;
end anatol;
