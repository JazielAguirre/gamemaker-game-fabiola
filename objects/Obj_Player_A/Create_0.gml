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

if (variable_global_exists("next_x")) {
    x = global.next_x;
    y = global.next_y;

    // Opcional: borrar variables para evitar reusar la posición
    global.next_x = undefined;
    global.next_y = undefined;
}
