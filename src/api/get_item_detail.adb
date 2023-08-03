with Adabots;
with Ada.Text_IO;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

procedure Get_Item_Detail is
   Bot : constant Adabots.Turtle := Adabots.Create_Turtle;
   Selected : constant Adabots.Item_Detail := Bot.Get_Item_Detail;
   Slot_4 : constant Adabots.Item_Detail := Bot.Get_Item_Detail (4);
begin
   Ada.Text_IO.Put_Line ("Selected: " & To_String (Selected.Name) & Selected.Count'Image);
   Ada.Text_IO.Put_Line ("Slot 4: " & To_String (Slot_4.Name) & Slot_4.Count'Image);
end Get_Item_Detail;
