with Ada.Text_IO;
with Adabots;

procedure Cheat_Spiral is

   Cheater : constant Adabots.Command_Computer :=
     Adabots.Create_Command_Computer;

   type Location_Material is record
      Location : Adabots.Relative_Location;
      Material : Adabots.Material;
   end record;

   type Air_Brush_Type is array (Positive range <>) of Location_Material;

   function Create_Air_Brush (Size : Positive) return Air_Brush_Type is
   begin
      return (1 .. Size => (Location => (0, 1, 0), Material => Adabots.Air));
   end Create_Air_Brush;

   procedure Move
     (A     : in out Air_Brush_Type; Offset : Adabots.Relative_Location;
      Block :        Adabots.Material)
   is
      use type Adabots.Relative_Location;
      Tail_To_Be_Cleared : constant Adabots.Relative_Location :=
        A (A'Last).Location;
   begin
      Cheater.Maybe_Set_Block (Tail_To_Be_Cleared, Adabots.Air);
      for I in reverse A'First .. A'Last - 1 loop
         A (I + 1) := A (I);
      end loop;
      A (A'First) :=
        (Location => A (A'First + 1).Location + Offset, Material => Block);
      Cheater.Maybe_Set_Block (A (A'First).Location, Block);
   end Move;

   procedure Clear (A : in out Air_Brush_Type) is
   begin
      for I in A'Range loop
         Move (A, (0, 0, 0), Adabots.Air);
      end loop;
   end Clear;

   Cheat_Brush : Air_Brush_Type := Create_Air_Brush (45);

   Spiral : constant array (Positive range <>) of Adabots.Relative_Location :=
     (1 => (1, 1, 0), 2 => (1, 0, 1), 3 => (0, 1, 1), 4 => (-1, 0, 1),
      5 => (-1, 1, 0), 6 => (-1, 0, -1), 7 => (0, 1, -1), 8 => (1, 0, -1));
begin

   Move (Cheat_Brush, (6, 0, -6), Adabots.Air);

   for D in 1 .. 4 loop
      for I in Spiral'Range loop
         Move (Cheat_Brush, Spiral (I), Adabots.Gold_Block);
      end loop;
   end loop;

   Clear (Cheat_Brush);

end Cheat_Spiral;
