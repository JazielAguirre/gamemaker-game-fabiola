// Step del obj_transicion
if (place_meeting(x, y, Obj_Player_A)) {
    show_debug_message("TRANSITION: desde room " + string(room) + " -> Room4?");
    global.next_x = 100; // coords ejemplo
    global.next_y = 550;
    global.transitioning_to = "Room4";
    show_debug_message("TRANSITION: globals seteadas: " + string(global.next_x) + "," + string(global.next_y));
    // Mostrar ID del recurso Room4 (útil para comprobar nombre)
    show_debug_message("TRANSITION: Room4 resource id = " + string(Room4));
    room_goto(Room4);
}
