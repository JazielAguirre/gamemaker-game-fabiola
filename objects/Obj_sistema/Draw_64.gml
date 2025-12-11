/// @description Dibujar Menús (Jugar, Reiniciar, Salir)

// Solo dibujamos si estamos en la sala de Menú o Game Over
if (room == global.rm_menu)
{
    // --- MENÚ PRINCIPAL ---
    var gw = display_get_gui_width();
    var gh = display_get_gui_height();
    
    // Configurar Fuente
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    if (font_exists(fnt_Game)) draw_set_font(fnt_Game); 
    draw_set_color(c_white);
    
    // Título
    draw_text_transformed(gw/2, gh/3, "Betty Bros", 2, 2, 0);
    
    // Botón JUGAR
    var btn_jugar_x = gw/2;
    var btn_jugar_y = gh/2;
    var texto_jugar = "JUGAR";
    
    // Detectar Mouse sobre Jugar
    var mx = device_mouse_x_to_gui(0);
    var my = device_mouse_y_to_gui(0);
    
    // Ancho/Alto aproximado del texto
    var w = string_width(texto_jugar) + 20;
    var h = string_height(texto_jugar) + 10;
    
    if (mx > btn_jugar_x - w/2 && mx < btn_jugar_x + w/2 && my > btn_jugar_y - h/2 && my < btn_jugar_y + h/2)
    {
        draw_set_color(c_yellow); // Hover
        if (mouse_check_button_pressed(mb_left))
        {
            // Acción: Ir al Nivel 1
            // Reiniciamos vidas y todo
            global.vidas = 3;
            global.puntos = 0;
            room_goto(global.rm_inicio);
        }
    }
    else
    {
        draw_set_color(c_white);
    }
    draw_text(btn_jugar_x, btn_jugar_y, texto_jugar);
    
    // Botón SALIR
    var btn_salir_y = gh/2 + 60;
    var texto_salir = "SALIR";
    
    if (mx > btn_jugar_x - w/2 && mx < btn_jugar_x + w/2 && my > btn_salir_y - h/2 && my < btn_salir_y + h/2)
    {
        draw_set_color(c_red); // Hover
        if (mouse_check_button_pressed(mb_left))
        {
            game_end();
        }
    }
    else
    {
        draw_set_color(c_gray);
    }
    draw_text(btn_jugar_x, btn_salir_y, texto_salir);
}
else if (room == global.rm_gameover_final) 
{
    // --- GAME OVER ---
    var gw = display_get_gui_width();
    var gh = display_get_gui_height();
    
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    if (font_exists(fnt_Game)) draw_set_font(fnt_Game); 
    draw_set_color(c_red);
    
    // Título burlón
    draw_text_transformed(gw/2, gh/3, "Has perdido por manco", 2, 2, 0);
    draw_set_color(c_white);
    draw_text(gw/2, gh/3 + 50, "Jajaja"); // Risa añadida
    
    // Botón REINICIAR
    var btn_x = gw/2;
    var btn_y = gh/2 + 20;
    var texto_reiniciar = "REINICIAR";
    
    var mx = device_mouse_x_to_gui(0);
    var my = device_mouse_y_to_gui(0);
    var w = string_width(texto_reiniciar) + 20;
    var h = string_height(texto_reiniciar) + 10;
    
    if (mx > btn_x - w/2 && mx < btn_x + w/2 && my > btn_y - h/2 && my < btn_y + h/2)
    {
        draw_set_color(c_yellow);
        if (mouse_check_button_pressed(mb_left))
        {
            // Reiniciar juego
            global.vidas = 3;
            global.puntos = 0;
            room_goto(global.rm_inicio);
        }
    }
    else
    {
        draw_set_color(c_white);
    }
    draw_text(btn_x, btn_y, texto_reiniciar);
    
    // Botón SALIR
    var btn_salir_y = btn_y + 60;
    var texto_salir = "SALIR AL MENU";
    
    // Recalcular ancho para este texto más largo
    var w_salir = string_width(texto_salir) + 20;
    
    if (mx > btn_x - w_salir/2 && mx < btn_x + w_salir/2 && my > btn_salir_y - h/2 && my < btn_salir_y + h/2)
    {
        draw_set_color(c_red);
        if (mouse_check_button_pressed(mb_left))
        {
            room_goto(global.rm_menu);
        }
    }
    else
    {
        draw_set_color(c_gray);
    }
    draw_text(btn_x, btn_salir_y, texto_salir);
}
else
{
    // --- HUD NORMAL (DURANTE EL JUEGO) ---
    
    // AJUSTES VISUALES
    var x_pos = 35; 
    var y_pos = 50; 
    var sep = 300;  // AUMENTADO: de 200 a 300 para evitar solapamiento (125Vidas)
    
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    if (font_exists(fnt_Game)) draw_set_font(fnt_Game);
    
    // COLOR NEGRO
    draw_set_color(c_black); 
    
    // DIBUJAR DATOS
    // 1. Puntaje
    draw_text(x_pos, y_pos, "Puntaje: " + string(global.puntos));
    
    // 2. Vidas
    draw_text(x_pos + sep, y_pos, "Vidas: " + string(global.vidas));
    
    // 3. Tiempo (Mundo eliminado)
    draw_text(x_pos + sep * 2, y_pos, "Tiempo: " + string(global.tiempo));
    
    // NOTA: Se eliminó el contador de "Items" y "Mundo" como pediste.
}

// --- TRANSICIÓN CIRCULAR (ESTILO MARIO) ---
if (global.dead_transition == true)
{
    var max_w = display_get_gui_width();
    var max_h = display_get_gui_height();
    
    // Reducir el radio
    global.trans_radius -= (max_w / 60); // Ajusta la velocidad dividiendo por más o menos
    
    // Si el círculo se cierra por completo
    if (global.trans_radius <= 0)
    {
        global.trans_radius = 0;
        global.dead_transition = false;
        
        // CAMBIAR DE SALA
        room_goto(global.trans_target_room);
    }
    
    // DIBUJAR LA MÁSCARA (CON SURFACE)
    // Usamos surfaces para hacer un hueco circular perfecto
    
    if (!surface_exists(global.surf_trans))
    {
        global.surf_trans = surface_create(max_w, max_h);
    }
    
    // Configuramos la "hoja" de dibujo
    surface_set_target(global.surf_trans);
    
    // 1. Pintamos todo de negro
    draw_clear(c_black);
    
    // 2. Activamos el modo "Sustraer" (Borrador)
    gpu_set_blendmode(bm_subtract);
    
    // 3. Dibujamos el círculo blanco (que borrará el negro)
    draw_set_color(c_white);
    draw_circle(max_w / 2, max_h / 2, global.trans_radius, false);
    
    // 4. Volvemos a la normalidad
    gpu_set_blendmode(bm_normal);
    surface_reset_target();
    
    // Finalmente, dibujamos la surface en la pantalla
    draw_surface(global.surf_trans, 0, 0);
}
