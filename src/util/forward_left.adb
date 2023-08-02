with Adabots;

procedure forward_left is
   Bot : constant Adabots.Turtle := Adabots.Create_Turtle;
begin
   loop
      exit when not Bot.Forward;
      bot.turn_left;
      exit when not Bot.Forward;
      bot.turn_right;
   end loop;
end forward_left;
