with Adabots;

procedure Flatten_Terrain is
   Bot : constant Adabots.Turtle := Adabots.Create_Turtle;
   Forward_Count : constant := 25;
   Rightward_Count : constant := 35;
   procedure Dig is
   begin
      Bot.Maybe_Dig_Down;
      Bot.Maybe_Dig;
      Bot.Maybe_Dig_Up;
      Bot.Forward;
   end Dig;
begin
   for X in 1 .. Rightward_Count loop
      for Y in 1 .. Forward_Count loop
         Dig;
      end loop;
      if X mod 2 = 0 then
         Bot.Turn_Left;
         Dig;
         Bot.Turn_Left;
      else
         Bot.Turn_Right;
         Dig;
         Bot.Turn_Right;
      end if;
   end loop;
end;
