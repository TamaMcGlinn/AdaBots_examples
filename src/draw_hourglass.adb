with Ada.Numerics.Elementary_Functions; use Ada.Numerics.Elementary_Functions;
with Ada.Numerics.Discrete_Random;
with Adabots;
with Ada.Text_IO;
with Ada.Exceptions;

procedure Draw_Hourglass is
   use type Adabots.Relative_Location;

   Cheater : constant Adabots.Command_Computer :=
     Adabots.Create_Command_Computer;

   Center                    : constant Adabots.Relative_Location := (0, 5, 0);
   Command_Computer_Position : constant Adabots.Absolute_Location :=
     (504, 4, 58); -- TODO determine this at runtime

   function In_Circle (X, Z, Radius : Integer) return Boolean is
      Product : constant Integer := X * X + Z * Z;
   begin
      return Product <= Radius * Radius;
   end In_Circle;

   function At_Circle (X, Z, Radius : Integer) return Boolean is
      Product : constant Integer := X * X + Z * Z;
      Less    : constant Integer :=
        (if Radius >= 1 then (Radius - 1) * (Radius - 1) else 0);
   begin
      return Product > Less and Product <= Radius * Radius;
   end At_Circle;

   Maze_Cell_Size : constant := 5;
   Maze_Size      : constant := Maze_Cell_Size * 2 + 1;

   type Shape_Type is (Filled, Outline);

   function Should_Fill_Cell_For_Circle
     (Shape : Shape_Type; X, Z, Radius : Integer) return Boolean
   is
   begin
      if Shape = Filled then
         return In_Circle (X, Z, Radius);
      else
         return At_Circle (X, Z, Radius);
      end if;
   end Should_Fill_Cell_For_Circle;

   use type Adabots.Material;
   function Get_Block_Info
     (Rel_Pos : Adabots.Relative_Location) return Adabots.Material is
     (Cheater.Get_Block_Info (Command_Computer_Position + Rel_Pos));
   function Place_Filled
     (Rel_Pos : Adabots.Relative_Location) return Boolean is
     (Get_Block_Info (Rel_Pos) /= Adabots.Air);
   function Air_Or_Sand (Rel_Pos : Adabots.Relative_Location) return Boolean is
      Actual : constant Adabots.Material := Get_Block_Info (Rel_Pos);
   begin
      return Actual = Adabots.Air or Actual = Adabots.Sand;
   end Air_Or_Sand;

   procedure Draw_Circle
     (Y_Pos, Radius : Integer; Block : Adabots.Material; Shape : Shape_Type)
   is
   begin
      for X in -(Radius + 1) .. Radius + 1 loop
         for Z in -(Radius + 1) .. Radius + 1 loop
            declare
               Position : constant Adabots.Relative_Location :=
                 Center + (X, Y_Pos, Z);
            begin
               if Should_Fill_Cell_For_Circle (Shape, X, Z, Radius) then
                  Cheater.Maybe_Set_Block (Position, Block);
                  if Block = Adabots.Sand then
                     declare
                        Below : constant Adabots.Relative_Location :=
                          Position + (0, -1, 0);
                     begin
                        if Get_Block_Info (Below) /= Adabots.Sand then
                           Ada.Text_IO.Put_Line
                             ("Need a sand mover at " &
                              Adabots.Image (Position));
                        end if;
                     end;
                  end if;
               end if;
            end;
         end loop;
      end loop;
   end Draw_Circle;

   procedure Draw_Dome (Block : Adabots.Material) is
   begin
      Draw_Circle (0, 7, Block, Outline);
      Draw_Circle (1, 7, Block, Outline);
      Draw_Circle (2, 6, Block, Outline);
      Draw_Circle (3, 6, Block, Outline);
      Draw_Circle (4, 6, Block, Outline);
      Draw_Circle (5, 5, Block, Outline);
      Draw_Circle (6, 5, Block, Outline);
      Draw_Circle (7, 4, Block, Outline);
      Draw_Circle (8, 3, Block, Outline);
      Draw_Circle (9, 2, Block, Outline);
      Draw_Circle (10, 1, Block, Outline);
      Cheater.Maybe_Set_Block (Center + (0, 10, 0), Block);
   end Draw_Dome;

   procedure Clear_Hourglass is
   begin
      for Y in reverse -1 .. 22 loop
         Draw_Circle (Y, 8, Adabots.Air, Filled);
      end loop;
   end Clear_Hourglass;

   procedure Place_Hourglass is
   begin
      -- bottom plank
      Draw_Circle (-1, 8, Adabots.Gold_Block, Filled);
      -- bottom glass
      Draw_Circle (0, 7, Adabots.Glass, Outline);
      Draw_Circle (1, 7, Adabots.Glass, Outline);
      Draw_Circle (2, 6, Adabots.Glass, Outline);
      Draw_Circle (3, 6, Adabots.Glass, Outline);
      Draw_Circle (4, 6, Adabots.Glass, Outline);
      Draw_Circle (5, 5, Adabots.Glass, Outline);
      Draw_Circle (6, 5, Adabots.Glass, Outline);
      Draw_Circle (7, 4, Adabots.Glass, Outline);
      Draw_Circle (8, 3, Adabots.Glass, Outline);
      Draw_Circle (9, 2, Adabots.Glass, Outline);
      Draw_Circle (10, 1, Adabots.Glass, Filled);
      -- top glass
      Draw_Circle (11, 1, Adabots.Glass, Outline);
      Draw_Circle (12, 2, Adabots.Glass, Outline);
      Draw_Circle (13, 3, Adabots.Glass, Outline);
      Draw_Circle (14, 4, Adabots.Glass, Outline);
      Draw_Circle (15, 5, Adabots.Glass, Outline);
      Draw_Circle (16, 5, Adabots.Glass, Outline);
      Draw_Circle (17, 6, Adabots.Glass, Outline);
      Draw_Circle (18, 6, Adabots.Glass, Outline);
      Draw_Circle (19, 6, Adabots.Glass, Outline);
      Draw_Circle (20, 7, Adabots.Glass, Outline);
      Draw_Circle (21, 7, Adabots.Glass, Outline);
      -- sand in top
      Draw_Circle (13, 1, Adabots.Sand, Filled);
      Draw_Circle (14, 2, Adabots.Sand, Filled);
      Draw_Circle (15, 3, Adabots.Sand, Filled);
      Draw_Circle (16, 3, Adabots.Sand, Filled);
      Draw_Circle (17, 5, Adabots.Sand, Filled);
      Draw_Circle (18, 5, Adabots.Sand, Filled);
      Draw_Circle (19, 5, Adabots.Sand, Filled);
      -- top plank
      Draw_Circle (22, 8, Adabots.Gold_Block, Filled);
   end Place_Hourglass;

   type Location_List is
     array (Positive range <>) of Adabots.Relative_Location;

   generic
      type Element_Type is private;
      type Array_Type is array (Positive range <>) of Element_Type;
   procedure Generic_Shuffle (List : in out Array_Type);
   procedure Generic_Shuffle (List : in out Array_Type) is
      package Discrete_Random is new Ada.Numerics.Discrete_Random
        (Result_Subtype => Integer);
      use Discrete_Random;
      K : Integer;
      G : Generator;
      T : Element_Type;
   begin
      Reset (G);
      for I in reverse List'Range loop
         K        := (Random (G) mod I) + 1;
         T        := List (I);
         List (I) := List (K);
         List (K) := T;
      end loop;
   end Generic_Shuffle;

   procedure Shuffle is new Generic_Shuffle
     (Element_Type => Adabots.Relative_Location, Array_Type => Location_List);

   procedure Disperse_Sand
     (Position : Adabots.Relative_Location; Offset : Adabots.Relative_Location)
   is
   begin
      while not Cheater.Set_Block (Position, Adabots.Air) loop
         delay 0.2;
      end loop;
      Cheater.Maybe_Set_Block (Position + Offset, Adabots.Sand);
   end Disperse_Sand;

   procedure Gather_Sand
     (Center : Adabots.Relative_Location; Source : Adabots.Relative_Location)
   is
   begin
      while not Cheater.Set_Block (Source, Adabots.Air) loop
         delay 0.8;
      end loop;
      Cheater.Maybe_Set_Block (Center, Adabots.Sand);
   end Gather_Sand;

   function Get_Ring_Offsets (Ring_Size : Positive) return Location_List is
      Output_Size : constant Positive := Ring_Size * 8;
      Result      : Location_List (1 .. Output_Size);
      Y           : constant Integer  := -Ring_Size;
   begin
      return Result : Location_List (1 .. Output_Size) do
         for I in -Ring_Size .. Ring_Size - 1 loop
            Result (I + Ring_Size + 1)     := (I, Y, Ring_Size);
            Result (I + 3 * Ring_Size + 1) := (I + 1, Y, -Ring_Size);
            Result (I + 5 * Ring_Size + 1) := (Ring_Size, Y, I + 1);
            Result (I + 7 * Ring_Size + 1) := (-Ring_Size, Y, I);
         end loop;
      end return;
   end Get_Ring_Offsets;

   function Get_All_Ring_Offsets (Ring_Size : Positive) return Location_List is
      Total_Size : constant Positive := (Ring_Size * (Ring_Size + 1)) * 4;
   begin
      return Result : Location_List (1 .. Total_Size) do
         for I in 1 .. Ring_Size loop
            declare
               Previous_Indexes : constant Natural := 8 * ((I * (I - 1)) / 2);
               Sub_Result : constant Location_List := Get_Ring_Offsets (I);
            begin
               for I in Sub_Result'Range loop
                  Result (Previous_Indexes + I) := Sub_Result (I);
               end loop;
            end;
         end loop;
      end return;
   end Get_All_Ring_Offsets;

   task type Sand_Spreader is
      entry Place (P : Adabots.Relative_Location);
   end Sand_Spreader;

   task body Sand_Spreader is
      Position : Adabots.Relative_Location;
   begin
      accept Place (P : Adabots.Relative_Location) do
         Position := P;
      end Place;
      for Height in 1 .. 8 loop
         Position := Position + (0, 1, 0);
         declare
            Ring : Location_List := Get_All_Ring_Offsets (Height);
         begin
            Shuffle (Ring);
            for Offset of Ring loop
               Disperse_Sand (Position, Offset);
            end loop;
         end;
      end loop;
   end Sand_Spreader;

   task type Sand_Collector is
      entry Place
        (Center : Adabots.Relative_Location; XZ_Extent : Natural;
         Height : Natural);
      entry Start_Moving_Sand;
   end Sand_Collector;

   function Find_Surrounding_Sand_Stacks
     (Center     : Adabots.Relative_Location; XZ_Max : Natural;
      Height_Max : Natural) return Location_List
   is
      All_Sand : Location_List
        (1 .. (XZ_Max * 2 + 1) * (XZ_Max * 2 + 1) * Height_Max);
      Found_Sand : Natural := 0;
   begin
      for X in -XZ_Max .. XZ_Max loop
         for Z in -XZ_Max .. XZ_Max loop
            if X /= 0 or Z /= 0 then
               -- count sand stacks
               declare
                  This_Block   : Adabots.Relative_Location;
                  First_Sand   : Adabots.Relative_Location;
                  Stack_Height : Natural := 0;
               begin
                  for H in 0 .. Height_Max loop
                     This_Block := Center + (X, H, Z);
                     if Get_Block_Info (This_Block) = Adabots.Sand then
                        if Stack_Height = 0 then
                           First_Sand := This_Block;
                        end if;
                        Stack_Height := Stack_Height + 1;
                     end if;
                  end loop;
                  for S in 1 .. Stack_Height loop
                     Found_Sand            := Found_Sand + 1;
                     All_Sand (Found_Sand) := First_Sand;
                  end loop;
               end;
            end if;
         end loop;
      end loop;
      return All_Sand (1 .. Found_Sand);
   end Find_Surrounding_Sand_Stacks;

   task body Sand_Collector is
      Position   : Adabots.Relative_Location;
      XZ_Max     : Natural;
      Height_Max : Natural;
   begin
      accept Place
        (Center : Adabots.Relative_Location; XZ_Extent : Natural;
         Height : Natural)
      do
         Position   := Center;
         XZ_Max     := XZ_Extent;
         Height_Max := Height;
      end Place;
      declare
         Stacks : Location_List :=
           Find_Surrounding_Sand_Stacks (Position, XZ_Max, Height_Max);
      begin
         Shuffle (Stacks);
         accept Start_Moving_Sand do
            null;
         end Start_Moving_Sand;
         for Offset of Stacks loop
            Gather_Sand (Position, Offset);
         end loop;
      end;
   end Sand_Collector;

   procedure Open_Hourglass is
   begin
      Cheater.Maybe_Set_Block ((0, 15, 0), Adabots.Air);
   end Open_Hourglass;

   Bottom_Sand : Sand_Spreader;
   Top_Sand    : Sand_Collector;
begin

   -- Clear_Hourglass;
   Place_Hourglass;

   Top_Sand.Place ((0, 17, 0), 5, 7);
   Top_Sand.Start_Moving_Sand;
   Open_Hourglass;
   Bottom_Sand.Place ((0, 5, 0));

end Draw_Hourglass;
