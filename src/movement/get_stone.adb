with Adabots;

procedure get_stone is
   Bot : constant Adabots.Turtle := Adabots.Create_Turtle;
   Down_Count : Integer := 0;
begin
   loop
      exit when bot.Detect_Down;
      bot.Down;
      Down_Count := Down_Count + 1;
   end loop;
   for I in 1 .. 10 loop
      bot.Suck_Down;
   end loop;
   for D in 1 .. Down_Count loop
      Bot.Up;
   end loop;
end get_stone;
