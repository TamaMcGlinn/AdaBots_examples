with Adabots;

procedure Spiral_Staircase is

   Bot : constant Adabots.Turtle := Adabots.Create_Turtle;

   procedure Place_Staircase (Staircase_Height : Integer) is
   begin
      for D in 1 .. Staircase_Height loop
         Bot.Up;
         Bot.Place_Down;
         Bot.Forward;
      end loop;
   end Place_Staircase;

begin

   Bot.Turn_Right;
   Bot.Forward;
   Bot.Turn_Left;

   Place_Staircase (6);
   Bot.Turn_Left;
   Place_Staircase (7);
   Bot.Turn_Left;

end Spiral_Staircase;
