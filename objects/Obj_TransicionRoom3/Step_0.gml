/*if (place_meeting(x, y, Obj_Player_A)) {
    global.next_x = 100; // posición donde quieres que aparezca
    global.next_y = 550;
    room_goto(Room4);
}*/
// Obj_Transicion (Step)
if (place_meeting(x, y, Obj_Player_A)) {
    show_debug_message("TRANSITION: triggering to RoomDestino desde room " + string(room));
    global.next_x = 100; // coords destino
    global.next_y = 550;
    global.transitioning = true; // flag general
	global.just_transitioned = true;
    room_goto(Room3); // reemplaza por el recurso real
}
