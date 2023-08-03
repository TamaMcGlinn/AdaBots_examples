with Adabots;
with Ada.Text_IO;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

procedure Get_Current_Tool is
   Bot : constant Adabots.Turtle := Adabots.Create_Turtle;
   Tool : constant Adabots.Tool_Info := Bot.Get_Current_Tool;
begin
   Ada.Text_IO.Put_Line ("Equipped: " & To_String (Tool.Name));
   Ada.Text_IO.Put_Line ("Uses left: " & Tool.Remaining_Uses'Image);
end Get_Current_Tool;
