if (place_meeting(x, y, Obj_Player_A)) {
    global.next_x = 100; // posición donde quieres que aparezca
    global.next_y = 550;
    room_goto(Room4);
}