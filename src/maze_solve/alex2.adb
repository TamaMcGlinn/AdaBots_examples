
with Adabots;

procedure alex2 is
   Bot : constant Adabots.Turtle := Adabots.Create_Turtle;
begin
   loop
      exit when false;
      Bot.Turn_Left;
      if Bot.Detect then
         Bot.Turn_Right;
      end if;

      if not Bot.Forward then
         loop
            exit when not Bot.Detect;
            Bot.Turn_Right;
         end loop;
      end if;
   end loop;
end alex2;
