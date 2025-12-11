
// DEBUG - al inicio del Step de Obj_Player_A (temporal)
if (current_time % room_speed == 0) { // muestra cada 1 segundo para no spamear demasiado
    var s = "Player DEBUG: pos=" + string(x) + "," + string(y)
          + " -- can_control=" + string(variable_instance_exists(id,"can_control") ? string(can_control) : "no_var")
          + " -- hspeed=" + string(variable_instance_exists(id,"hspeed") ? string(hspeed) : "no_var")
          + " -- vspeed=" + string(variable_instance_exists(id,"vspeed") ? string(vspeed) : "no_var");
    show_debug_message(s);
}

/// @description Lógica de Betty

// 1. OBTENER INPUTS (Teclado)
key_left = keyboard_check(vk_left);   // Flecha izquierda
key_right = keyboard_check(vk_right); // Flecha derecha
key_jump = keyboard_check_pressed(vk_up); // Flecha arriba 

// 2. CALCULAR MOVIMIENTO
// (1 - 0 = 1 derecha) | (0 - 1 = -1 izquierda) | (0 - 0 = 0 quieto)
var move = key_right - key_left;

hsp = move * walksp;    // Aplicar velocidad horizontal
vsp = vsp + grv;        // Aplicar gravedad constantemente

// 3. SALTO (Solo si está tocando el suelo)
// Verificamos si 1 pixel debajo de Betty hay piso
if (place_meeting(x, y + 1, Obj_Colision)) && (key_jump)
{
    vsp = -jumpsp; 
    // Aquí podrías poner un sonido, ej: audio_play_sound(snd_risabetty, 1, false);
}

// 4. COLISIÓN HORIZONTAL (Evitar atravesar paredes)
if (place_meeting(x + hsp, y, Obj_Colision))
{
    // Avanzar pixel por pixel hasta tocar la pared
    while (!place_meeting(x + sign(hsp), y, Obj_Colision))
    {
        x = x + sign(hsp);
    }
    hsp = 0; // Detener velocidad
}
x = x + hsp; // Aplicar movimiento final en X

// 5. COLISIÓN VERTICAL (Piso y Techo)
if (place_meeting(x, y + vsp, Obj_Colision))
{
    while (!place_meeting(x, y + sign(vsp), Obj_Colision))
    {
        y = y + sign(vsp);
    }
    vsp = 0; // Detener velocidad (aterrizar o golpearse la cabeza)
}
y = y + vsp; // Aplicar movimiento final en Y


// 6. ANIMACIÓN COMPLETA (Movimiento y Estático)

// SI BETTY SE MUEVE (Velocidad horizontal no es 0)
if (hsp != 0)
{
    image_speed = 1; // Activar la animación (que mueva las piernas)
    
    // Si va a la derecha
    if (hsp > 0) 
    {
        sprite_index = BettyFea; // Pon el nombre real de tu sprite derecho
    }
    // Si va a la izquierda
    else 
    {
        sprite_index = BettyFea_Left;
    }
}
// SI BETTY ESTÁ QUIETA (Velocidad es 0)
else
{
    image_speed = 0; // Detener la animación
    image_index = 0; // Poner el frame 0 (para que se vea parada y no con un pie en el aire)
    
    // NOTA: Como no cambiamos el 'sprite_index' aquí, 
    // se quedará con el último que usó (Izquierda o Derecha).
}

// ... (Todo tu código de movimiento) ...

// Efecto visual de parpadeo
if (invencible == true)
{
    // Si la opacidad es 1, la baja a 0.5, si es 0.5 la sube a 1
    if (image_alpha == 1) image_alpha = 0.5; else image_alpha = 1;
}
else
{
    image_alpha = 1; // Si no es invencible, se ve normal
}

// --- 7. VERIFICACIÓN DE MUERTE (NUEVO) ---
if (global.vidas <= 0)
{
    // Efectos de muerte (partículas? sonido?)
    // audio_play_sound(snd_muerte, 1, false);
    
    instance_destroy(); // Adiós Betty
    
    // --- INICIAR TRANSICIÓN ---
    global.dead_transition = true;
    global.trans_target_room = global.rm_gameover_final;
    global.trans_radius = display_get_gui_width(); // Empezar con todo el ancho
}