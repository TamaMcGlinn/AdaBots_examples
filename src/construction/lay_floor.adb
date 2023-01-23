with Adabots;
with Bot_Lib.IO;

procedure Lay_Floor is
   Forward_Count : constant Integer := Bot_Lib.IO.Ask_Num ("Forward amount: ");
   Rightward_Count : constant Integer := Bot_Lib.IO.Ask_Num ("Rightward amount: ");
   Bot : constant Adabots.Turtle := Adabots.Create_Turtle;
   procedure Place is
   begin
      Bot.Maybe_Place_Down;
      Bot.Forward;
   end Place;
begin
   for X in 1 .. Rightward_Count loop
      for Y in 1 .. Forward_Count loop
         Place;
      end loop;
      if X mod 2 = 0 then
         Bot.Turn_Left;
         Place;
         Bot.Turn_Left;
      else
         Bot.Turn_Right;
         Place;
         Bot.Turn_Right;
      end if;
   end loop;
end Lay_Floor;
