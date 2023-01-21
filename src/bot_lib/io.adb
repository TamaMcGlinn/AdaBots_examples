with Ada.Text_IO;

package body io is
   function Get_Num (Prompt : String) return Integer is
   begin
      Ada.Text_IO.Put_Line (Prompt);
      return Integer'Value (Ada.Text_IO.Get_Line);
   end Get_Num;
end io;
