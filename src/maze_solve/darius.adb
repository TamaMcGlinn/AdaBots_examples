with Adabots;

procedure darius is
   Bot : constant Adabots.Turtle := Adabots.Create_Turtle;
begin
   Bot.Forward;
   loop
      if not Bot.Detect then
         Bot.forward;
      else
         Bot.Turn_Left;
         if not Bot.Detect then
            Bot.Forward;
         else
            for i in 0 .. 1 loop
               Bot.Turn_Right;
            end loop;
            if not Bot.Detect then
               Bot.Forward;
            end if;
         end if;
      end if;
   end loop;
end darius;
