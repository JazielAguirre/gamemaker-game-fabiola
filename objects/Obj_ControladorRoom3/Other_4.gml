// Room Start de Obj_SpawnController (Room4)
show_debug_message("Room4: Room Start seguro - iniciando spawn check");

if (variable_global_exists("next_x") && variable_global_exists("next_y")) {
    var tx = global.next_x;
    var ty = global.next_y;
    var p = instance_find(Obj_Player_A, 0);

    if (p == noone) {
        show_debug_message("SpawnController: No se encontró Obj_Player_A (p==noone).");
    } else {
        // Intento 1: colocar directamente si está libre
        if (place_free(tx, ty)) {
            p.x = tx; p.y = ty;
            show_debug_message("SpawnController: colocado directamente en " + string(tx) + "," + string(ty));
        } else {
            // Si no está libre, buscar una posición cercana libre (8 direcciones, paso = 16px)
            var offsets = [[16,0],[-16,0],[0,16],[0,-16],[16,16],[-16,16],[16,-16],[-16,-16]];
            var placed = false;
            for (var i = 0; i < array_length(offsets); i++) {
                var ox = offsets[i][0];
                var oy = offsets[i][1];
                if (place_free(tx + ox, ty + oy)) {
                    p.x = tx + ox;
                    p.y = ty + oy;
                    placed = true;
                    show_debug_message("SpawnController: no libre en target; colocado en " + string(p.x) + "," + string(p.y));
                    break;
                }
            }
            if (!placed) {
                // Último recurso: colocarlo en coordenadas seguras por defecto (top-left)
                p.x = 32; p.y = 32;
                show_debug_message("SpawnController: no se encontró lugar cercano, colocado en 32,32");
            }
        }

        // Reset de velocidades y estados
        if (variable_instance_exists(p, "hspeed")) p.hspeed = 0;
        if (variable_instance_exists(p, "vspeed")) p.vspeed = 0;
        if (variable_instance_exists(p, "can_control")) p.can_control = true; // reactiva control
        // Limpia flags de transición si las usas
        if (variable_instance_exists(p, "is_transitioning")) p.is_transitioning = false;
        // Opcional: forzar re-inicio de la animación o estado
        if (variable_instance_exists(p, "state")) p.state = "idle";

        show_debug_message("SpawnController: control re-activado y velocidades cero.");
    }

    // limpiar globals
    global.next_x = undefined;
    global.next_y = undefined;
    global.transitioning_to = undefined;
} else {
    show_debug_message("SpawnController: no habia globals next_x/next_y.");
}
