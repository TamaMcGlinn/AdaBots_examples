with Adabots;
with Ada.Text_IO;

procedure Inspect is
   bot : constant Adabots.Turtle := Adabots.Create_Turtle;
begin
   Ada.Text_IO.Put_Line (bot.inspect'Image);
end Inspect;
