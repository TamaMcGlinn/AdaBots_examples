with Adabots;

procedure robin is
   Bot : constant Adabots.Turtle := Adabots.Create_Turtle (7114);
begin

   loop

      Bot.turn_left;
      loop
         if not Bot.forward then
            Bot.turn_right;
         end if;
      end loop;

   end loop;


end robin;
