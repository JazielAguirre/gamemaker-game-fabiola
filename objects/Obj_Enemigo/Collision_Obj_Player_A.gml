/// Lógica de Aplastar o Morir

// Verificar si el jugador está cayendo (vsp > 0) Y está encima del enemigo
// Ajusta el "y < y" según el tamaño de tus sprites
if (other.vsp > 0) && (other.bbox_bottom < y + (sprite_height / 2))
{
    // --- EL ENEMIGO PIERDE ---
    
    // 1. Hacemos rebotar a Betty (jugador)
    other.vsp = -7; // Un saltito
    
    // 2. Efecto de sonido (Opcional)
    // audio_play_sound(Snd_Golpe, 1, false);
    
    // 3. Destruir a Patricia
    instance_destroy();
}
else
{
    // --- BETTY PIERDE ---
    
    // Aquí pon tu lógica de daño.
    // Como vi en tu código que usan "global.vidas", úsalo:
    
    global.vidas -= 1;
    
    // Reiniciar la sala o poner al jugador en el inicio
    if (global.vidas > 0) {
        room_restart(); 
    } else {
        room_goto(global.rm_gameover); // Ir a pantalla de Game Over
    }
}