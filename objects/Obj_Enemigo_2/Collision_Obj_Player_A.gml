/// @description Daño o Muerte (+75 Puntos)

// Checar si el jugador cae sobre el enemigo (Mario style stomp)
if (other.vsp > 0) && (other.bbox_bottom < bbox_bottom - (sprite_height/2))
{
    // Rebotar al jugador
    other.vsp = -7;
    
    // Sumar 75 puntos (Petición usuario)
    global.puntos += 75;
    
    // Morir
    instance_destroy();
}
else
{
    // HACER DAÑO AL JUGADOR
    if (other.invencible == false)
    {
        global.vidas -= 1;
        other.invencible = true;
        other.alarm[0] = 90; // Tiempo inmunidad
        
        // Empuje (Knockback) simple
        // other.vsp = -5;
        // other.hsp = sign(other.x - x) * 4;
        
        // Si muere, la lógica está en el Step del Player.
    }
}
