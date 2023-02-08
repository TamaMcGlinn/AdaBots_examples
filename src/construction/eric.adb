with Adabots;

procedure eric is
   Bot : constant Adabots.Turtle := Adabots.Create_Turtle;

   S : constant string := "ADABOTS";

   type Selection is range 0 .. 16;
   Letter_Width : constant := 5;
   type Block_Matrix is array (1 .. 5, 1 .. Letter_Width) of Selection;
   subtype Supported_Character is Character range 'A' .. 'T';
   type Letter_Matrix is array (Supported_Character) of Block_Matrix;

   Letters : constant Letter_Matrix := (
      'A' => (
         (0, 1, 1, 0, 0),
         (1, 0, 0, 1, 0),
         (1, 1, 1, 1, 0),
         (1, 0, 0, 1, 0),
         (1, 0, 0, 1, 0)),
      'B' => (
         (1, 1, 1, 0, 0),
         (1, 0, 0, 1, 0),
         (1, 1, 1, 0, 0),
         (1, 0, 0, 1, 0),
         (1, 1, 1, 0, 0)),
      'C' => (
         (0, 1, 1, 0, 0),
         (1, 0, 0, 1, 0),
         (1, 0, 0, 0, 0),
         (1, 0, 0, 1, 0),
         (0, 1, 1, 0, 0)),
      'D' => (
         (1, 1, 1, 0, 0),
         (1, 0, 0, 1, 0),
         (1, 0, 0, 1, 0),
         (1, 0, 0, 1, 0),
         (1, 1, 1, 0, 0)),
      'E' => (
         (1, 1, 1, 1, 0),
         (1, 0, 0, 0, 0),
         (1, 1, 1, 1, 0),
         (1, 0, 0, 0, 0),
         (1, 1, 1, 1, 0)),
      'I' => (
         (0, 1, 1, 1, 0),
         (0, 0, 1, 0, 0),
         (0, 0, 1, 0, 0),
         (0, 0, 1, 0, 0),
         (0, 1, 1, 1, 0)),
      'O' => (
         (0, 1, 1, 0, 0),
         (1, 0, 0, 1, 0),
         (1, 0, 0, 1, 0),
         (1, 0, 0, 1, 0),
         (0, 1, 1, 0, 0)),
      'R' => (
         (1, 1, 1, 0, 0),
         (1, 0, 0, 1, 0),
         (1, 1, 1, 0, 0),
         (1, 0, 1, 0, 0),
         (1, 0, 0, 1, 0)),
      'S' => (
         (0, 1, 1, 1, 0),
         (1, 0, 0, 0, 0),
         (0, 1, 1, 0, 0),
         (0, 0, 0, 1, 0),
         (1, 1, 1, 0, 0)),
      'T' => (
         (1, 1, 1, 1, 1),
         (0, 0, 1, 0, 0),
         (0, 0, 1, 0, 0),
         (0, 0, 1, 0, 0),
         (0, 0, 1, 0, 0)),
      others => (
         (0, 0, 0, 0, 0),
         (0, 0, 0, 0, 0),
         (0, 0, 1, 0, 0),
         (0, 0, 0, 0, 0),
         (0, 0, 0, 0, 0))
      );

   procedure Build (Bottom, Self, Top : Selection) is
   begin
      if Bottom /= 0 then
         -- TODO selection
         Bot.Place_Down;
      end if;
      if Top /= 0 then
         Bot.Place_Up;
      end if;
      Bot.back;
      if Self /= 0 then
         Bot.Place;
      end if;
   end Build;
begin
   -- position one above floor
   loop
      exit when not Bot.Down;
   end loop;
   Bot.Up;

   -- turn around
   Bot.Turn_Left;
   Bot.Turn_Left;

   -- bottom half
   for Char of S loop
      declare
         L : constant Block_Matrix := Letters (Supported_Character (Char));
      begin
         for I in 1 .. Letter_Width loop
            declare
               Bottom : constant Selection := L (5, I);
               Self : constant Selection := L (4, I);
               Top : constant Selection := L (3, I);
            begin
               Build (Bottom, Self, Top);
            end;
         end loop;
      end;
   end loop;

   for U in 1 .. 3 loop
      Bot.Up;
   end loop;

   -- turn around
   Bot.Turn_Left;
   Bot.Turn_Left;
   Bot.Back;

   -- top half, backwards
   for Char of reverse S loop
      declare
         L : constant Block_Matrix := Letters (Supported_Character (Char));
      begin
         for I in reverse 1 .. Letter_Width loop
            declare
               Bottom : constant Selection := L (2, I);
               Self : constant Selection := L (1, I);
            begin
               Build (Bottom, Self, 0);
            end;
         end loop;
      end;
   end loop;
end eric;
