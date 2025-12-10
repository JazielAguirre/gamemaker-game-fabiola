// Create de Obj_SpawnController
if (variable_global_exists("next_x") && variable_global_exists("next_y")) {
    // buscar la instancia del jugador persistente
    var p = instance_find(Obj_Player_A, 0); // 0 = primera instancia
    if (p != noone) {
        p.x = global.next_x;
        p.y = global.next_y;
    }
    // limpiar globals
    global.next_x = undefined;
    global.next_y = undefined;
}
