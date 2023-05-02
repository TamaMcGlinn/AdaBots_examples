with Adabots;
with Ada.Text_IO;

procedure test is
   Bot : constant Adabots.Turtle := Adabots.Create_Turtle;
begin
   Ada.Text_IO.Put_Line (bot.Inspect'Image);
end test;
