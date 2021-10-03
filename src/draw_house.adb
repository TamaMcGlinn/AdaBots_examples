with Ada.Numerics.Elementary_Functions; use Ada.Numerics.Elementary_Functions;
with Adabots;
with Ada.Text_IO;

procedure Draw_House is

   use type Adabots.Relative_Location;

   Cheater : constant Adabots.Command_Computer :=
     Adabots.Create_Command_Computer;

   Center : constant Adabots.Relative_Location := (10, 0, 10);

begin

   -- -- 4 walls
   -- Cheater.Set_Cube ((10, 0, 10), (25, 4, 10), Adabots.Gold_Block);
   -- Cheater.Set_Cube ((10, 0, 11), (10, 4, 25), Adabots.Gold_Block);
   -- Cheater.Set_Cube ((10, 0, 26), (25, 4, 26), Adabots.Gold_Block);
   -- Cheater.Set_Cube ((26, 0, 10), (26, 4, 26), Adabots.Gold_Block);
   --
   -- -- window
   -- Cheater.Set_Cube ((12, 1, 10), (14, 2, 10), Adabots.Glass);
   --
   -- -- door
   -- Cheater.Set_Cube ((22, 0, 26), (24, 3, 26), Adabots.Air);
   Cheater.Set_Cube ((22, 2, 26), (24, 3, 26), Adabots.OrangeWool);
   Cheater.Set_Cube ((24, 0, 26), (24, 2, 26), Adabots.OrangeWool);
   -- Cheater.Set_Cube ((22, 0, 26), (23, 0, 26), Adabots.Wooden_Door);
   --
   -- -- window
   -- Cheater.Set_Cube ((16, 1, 10), (18, 2, 10), Adabots.Glass);
   --
   -- -- window
   -- Cheater.Set_Cube ((10, 1, 14), (10, 2, 16), Adabots.Glass);
   --
   -- -- window
   -- Cheater.Set_Cube ((10, 1, 18), (10, 2, 19), Adabots.Glass);
   --
   -- -- window
   -- Cheater.Set_Cube ((26, 1, 14), (26, 2, 16), Adabots.Glass);
   --
   -- -- window
   -- Cheater.Set_Cube ((26, 1, 18), (26, 2, 19), Adabots.Glass);
   --
   -- -- glass roof
   -- Cheater.Set_Cube ((10, 5, 10), (26, 5, 26), Adabots.Glass);
   --
   -- -- wood floor
   -- Cheater.Set_Cube ((10, -1, 10), (26, -1, 26), Adabots.Planks);

   -- inner wall
   -- Cheater.Set_Cube ((11, 0, 17), (18, 4, 17), Adabots.Stone);

end Draw_House;
