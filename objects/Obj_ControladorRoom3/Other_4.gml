show_debug_message("SpawnController: Room Start en " + string(room) + ", transitioning=" + string(global.transitioning));
if (variable_global_exists("transitioning") && global.transitioning) {
    var p = instance_find(Obj_Player_A, 0);
    if (p != noone) {
        p.x = global.next_x;
        p.y = global.next_y;
        show_debug_message("SpawnController: reposicionado jugador a " + string(p.x) + "," + string(p.y));
    } else {
        show_debug_message("SpawnController: NO se encontró el jugador (p==noone).");
    }
    global.next_x = undefined;
    global.next_y = undefined;
    global.transitioning = false;
}
