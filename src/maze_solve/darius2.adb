with Adabots;

procedure darius2 is
   procedure free is new ada.unchecked_deallocation (mystruct)

   Bot : constant Adabots.Turtle := Adabots.Create_Turtle;
   type mystruct;
   type mystruct is record
      prev : access mystruct;
      next : access mystruct;
      left : Integer;
      right : Integer;
      forward : Integer;
   end record;
   procedure append (a : access mystruct; b : access mystruct) is
   begin
      a.next := b;
      b.prev := a;
   end append;

   procedure flow (go : access mystruct; deadend : in Boolean) is
      reader : access mystruct := go;
   begin
      if deadend then
         Bot.Back;
         reader := reader.prev;
         if reader.forward = 2 then
            if reader.right = 1 then

               Bot.turn_right;
               Bot.forward;
               reader.right := 2;
               append(reader, new mystruct);
               reader := reader.next;
            else if reader.left
               if not Bot.Detect then
                  Bot.forward; append(go, new mystruct);
                  reader := go.next;
                  Bot.turn_right;
                  if not Bot.Detect then
                     reader.right := 1;
                  end if;
                  Bot.turn_left;
                  Bot.turn_left;
                  if not Bot.Detect then
                     reader.left := 1;
                  end if;
                  Bot.turn_right;
                  flow(go, false);
               end if;
            end flow;


            f : aliased mystruct;
            begin
               f.next := NULL;
               f.prev := NULL;
               flow(f'access);
               flow(f);
