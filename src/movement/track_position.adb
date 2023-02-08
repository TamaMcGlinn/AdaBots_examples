with Adabots;
with Ada.Text_IO;
use Ada.Text_IO;

procedure track_position is
   Bot : constant Adabots.Turtle := Adabots.Create_Turtle;

   X : Integer := 0;
   Y : Integer := 0;
   type Direction is mod 4;
   D : Direction := 0;

   procedure Left is
   begin
      Bot.Turn_Left;
      D := D - 1;
      Put_Line ("Direction: " & D'Image);
   end Left;

   procedure Right is
   begin
      Bot.Turn_Right;
      D := D + 1;
      Put_Line ("Direction: " & D'Image);
   end Right;

   procedure Forward is
      type Positivity_Type is range 0 .. 1;
      Positivity : constant Positivity_Type := Positivity_Type (1 - (D / 2));
      type Position_Change is range -1 .. 1 with Dynamic_Predicate => Position_Change /= 0;
      P : constant Position_Change := Position_Change ((Integer(Positivity) * 2) - 1);
   begin
      Bot.Forward;
      if D mod 2 = 0 then
         Y := Y + Integer(P);
      else
         X := X + Integer(P);
      end if;
   end Forward;

   procedure Return_To_Start is
   begin
      Bot.Up;
      for I in 1 .. D loop
         Bot.Turn_Left;
      end loop;
      for Y_Back in 1 .. Y loop
         Bot.Back;
      end loop;
      for Y_Back in Y .. -1 loop
         Bot.Forward;
      end loop;
      Bot.Turn_Right;
      for X_Back in 1 .. X loop
         Bot.Back;
      end loop;
      for X_Back in X .. -1 loop
         Bot.Forward;
      end loop;
      Bot.Down;
      Bot.Turn_Left;
   end Return_To_Start;
begin

   Forward;
   Forward;
   Left;
   Left;
   Forward;
   Forward;
   Forward;
   Left;
   Left;
   Left;
   Forward;
   Left;
   Right;
   Forward;

   Return_To_Start;

end track_position;
