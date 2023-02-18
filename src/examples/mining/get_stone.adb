with Adabots;

procedure Get_Stone is
   Bot         : constant Adabots.Turtle := Adabots.Create_Turtle;
   Depth         : constant Integer        := 20;
   Tunnel_Length : constant Integer        := 20;
begin

   --  go down
   for Current_Depth in 1 .. Depth loop
      Bot.Maybe_Dig_Down;
      Bot.Down;
   end loop;

   --  dig tunnel forward, big enough to walk in
   for Current_Length in 1 .. Tunnel_Length loop
      Bot.Maybe_Dig_Down;
      Bot.Maybe_Dig;
      Bot.Forward;
      Bot.Maybe_Dig_Up;
   end loop;

   --  walk back to shaft
   for Current_Length in 1 .. Tunnel_Length loop
      Bot.Back;
   end loop;

   --  come back up
   for Current_Depth in 1 .. Depth loop
      Bot.Up;
   end loop;

end Get_Stone;
