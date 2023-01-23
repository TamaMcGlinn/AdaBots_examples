with Ada.Text_IO;

package body bot_lib.io is
   function Ask_Num (Prompt : String) return Integer is
   begin
      Ada.Text_IO.Put_Line (Prompt);
      return Integer'Value (Ada.Text_IO.Get_Line);
   end Ask_Num;
end bot_lib.io;
