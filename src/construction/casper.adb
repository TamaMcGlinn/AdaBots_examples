with Adabots;

procedure casper is
   Bot : constant Adabots.Turtle := Adabots.Create_Turtle;
begin
   loop
      bot.forward;
      bot.down;
      bot.place_down;
   end loop;
end casper;
