/// @description Variables de Movimiento

hsp = 0;        // Velocidad Horizontal actual
vsp = 0;        // Velocidad Vertical actual
grv = 0.5;      // Gravedad (qué tan fuerte cae Betty)
walksp = 4;     // Velocidad al caminar (cámbialo si quieres que corra más rápido)
jumpsp = 14;     // Fuerza del salto

sprite_right = BettyFea; // ASUME que tienes un sprite para la derecha llamado sBettyFea_Right
sprite_left = BettyFea_Left;   // Tu sprite para la izquierda

// ... (Tus otras variables hsp, vsp, etc.)

invencible = false; // Al principio no es invencible

// Create de Obj_Player_A (parte de spawn seguro)
if (variable_global_exists("next_x") && variable_global_exists("next_y")) {
    // Verificar que sean valores numéricos válidos
    if (is_real(global.next_x) && is_real(global.next_y)) {
        x = global.next_x;
        y = global.next_y;
    } else {
        show_debug_message("Warning: global.next_x/y no son reales: " + string(global.next_x) + "," + string(global.next_y));
    }

    // Limpiar globals para que no se reutilicen
    global.next_x = undefined;
    global.next_y = undefined;
} else {
    // No hay globals: comportamiento por defecto (opcional)
    // x = x; y = y; // nada por hacer
    // show_debug_message("Obj_Player_A Create: no habia globals next_x/next_y");
}

