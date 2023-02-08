with Adabots;

procedure test is
   Bot : constant Adabots.Turtle := Adabots.Create_Turtle;
begin
   while not bot.Detect_Down loop Bot.Down; end loop;
   --    while Bot.Detect loop Bot.Dig; end loop;
   --    Bot.Forward;
   --    while Bot.Detect_up loop Bot.Dig_Up; end loop;
   --    Bot.Up;
   -- end loop;
end test;
