/// Lógica de daño corregida (SIN REINICIAR SALA)

// 1. Verificamos si Betty le cae encima (Aplastado)
if (other.vsp > 0) && (other.bbox_bottom < y + (sprite_height / 2))
{
    // Betty rebota
    other.vsp = -7; 
    // Enemigo muere
    instance_destroy(); 
}
else
{
    // 2. DAÑO AL JUGADOR
    
    // Verificamos si Betty tiene el escudo activo
    if (other.invencible == false)
    {
        // Solo si NO es invencible, le quitamos vida
        global.vidas -= 1; 
        
        // --- AQUÍ ESTÁ LA CLAVE ---
        // Activamos la invulnerabilidad en Betty
        other.invencible = true;
        
        // Activamos la alarma 0 de Betty para que el escudo dure 1.5 segundos (90 frames)
        other.alarm[0] = 90; 
        
        // Empujón hacia atrás (Knockback) para separar a Betty del enemigo
        if (other.x < x) {
            other.hsp = -5; // Empujar izquierda
        } else {
            other.hsp = 5;  // Empujar derecha
        }
        other.vsp = -4; // Saltito de dolor

        // Reproducir sonido de daño (opcional)
        // audio_play_sound(snd_golpe, 1, false);

        // 3. GAME OVER (Solo si las vidas llegan a 0)
        if (global.vidas <= 0)
        {
            // Aquí sí reiniciamos o vamos a la pantalla de perder
            // room_restart(); 
            // O mejor:
            room_goto(global.rm_gameover); 
        }
    }
}