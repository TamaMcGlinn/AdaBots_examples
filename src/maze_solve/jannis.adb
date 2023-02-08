with Adabots;

procedure jannis is
   Bot : constant Adabots.Turtle := Adabots.Create_Turtle;
begin
   loop
      Bot.Turn_Right;
      loop
         exit when not Bot.Detect;
         Bot.Turn_Left;
      end loop;
      Bot.Forward;
   end loop;
end jannis;
