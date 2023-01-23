with Ada.Text_IO;
with Ada.Numerics.Discrete_Random;

with Adabots;

procedure Build_Maze is
   package Random_Integer is new Ada.Numerics.Discrete_Random
      (Result_Subtype => Natural);
   Gen : Random_Integer.Generator;

   use type Adabots.Stack_Count;

   Bot : constant Adabots.Turtle := Adabots.Create_Turtle;

   X_Cells     : constant Positive := 12;
   Y_Cells     : constant Positive := 12;
   Maze_Width  : constant Integer  := X_Cells * 2 + 1;
   Maze_Length : constant Integer  := Y_Cells * 2 + 1;
   type Cell is (Filled, Empty);

   type Maze_X is range 0 .. Maze_Width - 1;
   type Maze_Y is range 0 .. Maze_Length - 1;
   type Maze is array (Maze_X'Range, Maze_Y'Range) of Cell;

   M : Maze := (others => (others => Filled));

   type Maze_Coordinate is record
      X : Maze_X;
      Y : Maze_Y;
   end record;

   type Neighbour_Count is range 0 .. 4;
   subtype Positive_Neighbour_Count is
   Neighbour_Count range 1 .. Neighbour_Count'Last;

   type Neighbours is array (Neighbour_Count range <>) of Maze_Coordinate;

   procedure Clear (P : Maze_Coordinate) is
   begin
      M (P.X, P.Y) := Empty;
   end Clear;

   function Get_Unvisited_Neighbours (P : Maze_Coordinate) return Neighbours is
      Result      : Neighbours := (Positive_Neighbour_Count'Range => (0, 0));
      Last_Result : Neighbour_Count := 0;

      type X_Offset is range -2 .. 2;
      -- with Dynamic_Predicate => (X_Offset in (-2, 0, 2)); -- TODO for both
      type Y_Offset is range -2 .. 2;

      function Is_Filled (C : Maze_Coordinate) return Boolean is
      begin
         return M (C.X, C.Y) = Filled;
      end Is_Filled;

      procedure Checked_Add (X_Diff : X_Offset; Y_Diff : Y_Offset) is
         New_X : constant Integer := Integer (P.X) + Integer (X_Diff);
         New_Y : constant Integer := Integer (P.Y) + Integer (Y_Diff);
      begin
         if New_X >= Integer (Maze_X'First) and
            New_X <= Integer (Maze_X'Last) and
            New_Y >= Integer (Maze_Y'First) and New_Y <= Integer (Maze_Y'Last)
         then
            declare
               New_Coord : constant Maze_Coordinate :=
                  (Maze_X (New_X), Maze_Y (New_Y));
            begin
               if Is_Filled (New_Coord) then
                  Last_Result          := Last_Result + 1;
                  Result (Last_Result) := New_Coord;
               end if;
            end;
         end if;
      end Checked_Add;
   begin
      Checked_Add (0, -2);
      Checked_Add (0, +2);
      Checked_Add (-2, 0);
      Checked_Add (+2, 0);
      return Result (1 .. Last_Result);
   end Get_Unvisited_Neighbours;

   function Choose_Random (L : Neighbours) return Maze_Coordinate is
      -- TODO precondition L not empty
      Random : constant Natural := Random_Integer.Random (Gen);
      Offset : constant Natural := Random mod L'Length;
      Index  : constant Natural := Natural (L'First) + Offset;
   begin
      return L (Neighbour_Count (Index));
   end Choose_Random;

   function Mid_Point
      (One : Maze_Coordinate; Two : Maze_Coordinate) return Maze_Coordinate
   is
   begin
      return ((One.X + Two.X) / 2, (One.Y + Two.Y) / 2);
   end Mid_Point;

   procedure Populate_Maze is
      procedure Build_Random_Route (Current_Coordinate : Maze_Coordinate) is
      begin
         Clear (Current_Coordinate); -- this also marks it visited
         loop
            declare
               Unvisited_Neighbours : constant Neighbours :=
                  Get_Unvisited_Neighbours (Current_Coordinate);
            begin
               if Unvisited_Neighbours'Length = 0 then
                  return;
               end if;
               declare
                  Chosen_Neighbour : constant Maze_Coordinate :=
                     Choose_Random
                        (Get_Unvisited_Neighbours (Current_Coordinate));
               begin
                  Clear (Mid_Point (Current_Coordinate, Chosen_Neighbour));
                  Build_Random_Route (Chosen_Neighbour);
               end;
            end;
         end loop;
      end Build_Random_Route;

      Way_In  : constant Maze_Coordinate := (1, 0);
      Way_Out : constant Maze_Coordinate := (Maze'Last (1) - 1, Maze'Last (2));
   begin
      Clear (Way_In);
      Clear (Way_Out);
      Build_Random_Route ((Maze'Last (1) - 3, Maze'Last (2) - 3));
   end Populate_Maze;

   Current_Slot : Adabots.Turtle_Inventory_Slot := Bot.Get_Selected_Slot;

   procedure Find_Building_Material is
   begin
      if Bot.Get_Item_Count (Current_Slot) /= 0 then
         return;
      end if;
      Ada.Text_IO.Put_Line ("Looking for building material");
      loop
         for S in Adabots.Turtle_Inventory_Slot'Range loop
            if Bot.Get_Item_Count (S) /= 0 then
               Bot.Select_Slot (S);
               Current_Slot := S;
               Ada.Text_IO.Put_Line ("Selected slot " & Current_Slot'Image);
               return;
            end if;
         end loop;
         Ada.Text_IO.Put_Line ("Give me something to build with!");
      end loop;
   end Find_Building_Material;

   generic
   with function Placer return Boolean;
   procedure Generic_Place_Dir;

   procedure Generic_Place_Dir is
   begin
      loop
         Find_Building_Material;
         exit when Placer;
         Bot.Drop;
      end loop;
   end Generic_Place_Dir;

   procedure Place is new Generic_Place_Dir (Placer => Bot.Place);
   procedure Place_Down is new Generic_Place_Dir (Placer => Bot.Place_Down);
   procedure Place_Up is new Generic_Place_Dir (Placer => Bot.Place_Up);

   -- Go back; if not possible, turn around and dig first
   -- as an optimization so we don't keep turning around
   -- to break a single block, go forward digging up until
   -- Max_Count blocks and then return to the correct square
   procedure Back (Max_Count : Integer) is
      Amount_Cleared : Integer := 0;
   begin
      if Bot.Back then
         return;
      end if;
      Bot.Turn_Left;
      Bot.Turn_Left;
      for X in 1 .. Max_Count loop
         exit when not Bot.Detect;
         Bot.Dig;
         Bot.Forward;
         Amount_Cleared := Amount_Cleared + 1;
      end loop;
      for Back_X in 2 .. Amount_Cleared loop
         Bot.Back;
      end loop;
      Bot.Turn_Left;
      Bot.Turn_Left;
   end Back;

   -- build cell by first placing below, and
   -- if the cell is filled, also
   -- placing at the level of the bot and above
   procedure Build_Cell_With_Regular_Blocks (X : Maze_X; Y : Maze_Y) is
      C : constant Cell := M (X, Y);
   begin
      Bot.Maybe_Dig_Up;
      Bot.Maybe_Dig_Down;
      if C = Filled then
         Place_Up;
      end if;
      Place_Down;
      Back (Maze_Length - Integer (Y));
      if C = Filled then
         Place;
      end if;
   end Build_Cell_With_Regular_Blocks;

   -- build cell with walls; since walls are impassible to
   -- players but the bot can fly over them, we just need to place one below
   -- this is much faster but assumes we have a flat surface to build on
   -- and have cleared space to fly
   procedure Build_Cell_With_Walls (X : Maze_X; Y : Maze_Y) is
      C : constant Cell := M (X, Y);
   begin
      if C = Filled then
         Place_Down;
      end if;
      Back (Maze_Length - Integer (Y));
   end Build_Cell_With_Walls;

   procedure Build_Cell (X : Maze_X; Y : Maze_Y) renames Build_Cell_With_Walls;
   pragma Unreferenced (Build_Cell_With_Regular_Blocks);
   -- pragma Unreferenced (Build_Cell_With_Walls);

   procedure Place_Maze is
   begin
      Bot.Turn_Left;
      Bot.Turn_Left;
      Bot.Back;
      Bot.Back;

      for X in M'Range (1) loop
         for Y_From_Start in M'Range (2) loop
            declare
               Y : constant Maze_Y := (if Y_From_Start mod 2 = 0 then Y_From_Start else Maze_Y'Last - Y_From_Start);
            begin
               Build_Cell (X, Y);
            end;
         end loop;
         declare
            procedure Turn is
            begin
               if X mod 2 = 0 then
                  Bot.Turn_Left;
               else
                  Bot.Turn_Right;
               end if;
            end Turn;
         begin
            Turn;
            Back (1);
            Turn;
            Back (1);
         end;
      end loop;
   end Place_Maze;

   function Cell_Image (X : Maze_X; Y : Maze_Y) return Character is
   begin
      if M (X, Y) = Filled then
         return 'X';
      else
         return ' ';
      end if;
   end Cell_Image;

   procedure Print_Maze_Column (X : Maze_X) is
   begin
      for Y in M'Range (2) loop
         Ada.Text_IO.Put (Cell_Image (X, Y));
      end loop;
      Ada.Text_IO.New_Line;
   end Print_Maze_Column;

   procedure Print_Maze is
   begin
      for X in M'Range (1) loop
         Print_Maze_Column (X);
      end loop;
   end Print_Maze;

   procedure Fill_Inventory is
   begin
      loop
         exit when not Bot.Suck_Down;
      end loop;
   end Fill_Inventory;
begin
   Fill_Inventory;
   Populate_Maze;
   Print_Maze;
   Place_Maze;
end Build_Maze;
