with Adabots;

procedure dig is
   Bot : constant Adabots.Turtle := Adabots.Create_Turtle;
begin
   bot.dig; -- digs forward
   bot.Dig_Up;
   bot.Dig_Down;
end dig;
