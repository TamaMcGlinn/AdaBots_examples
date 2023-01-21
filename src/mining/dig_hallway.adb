with Ada.Text_IO;
with Adabots;

procedure Dig_Hallway is
   Bot : constant Adabots.Turtle := Adabots.Create_Turtle;

   function How_Far return Integer is
   begin
      Ada.Text_IO.Put_Line ("How long?");
      return Integer'Value (Ada.Text_IO.Get_Line);
   end How_Far;

   Length : constant Integer := How_Far;

begin

   for D in 1 .. Length loop

      while Bot.Detect loop
         Bot.Dig;
      end loop;

      Bot.Forward;
      Bot.Maybe_Dig_Up;
      Bot.Maybe_Dig_Down;
   end loop;

end Dig_Hallway;
