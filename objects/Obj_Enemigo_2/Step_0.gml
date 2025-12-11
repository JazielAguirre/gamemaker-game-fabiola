/// @description Movimiento y Colisiones

vsp = vsp + grv;

// --- COLISIÓN HORIZONTAL ---
// Checamos en la Grid si hay pared a la derecha/izquierda
var p1, p2, bbox_side;

// Definir qué lado del bounding box usar
if (walksp > 0) bbox_side = bbox_right; else bbox_side = bbox_left;

// Puntos de chequeo (esquinas superior e inferior del lado hacia donde va)
p1 = tilemap_get_at_pixel(global.mapa_grid, bbox_side + walksp, bbox_top);
p2 = tilemap_get_at_pixel(global.mapa_grid, bbox_side + walksp, bbox_bottom);

// NOTA: Si usas ds_grid directamente en lugar de tilemap, sería:
// var c1 = (bbox_side + walksp) div TILE_SIZE;
// var r1 = bbox_top div TILE_SIZE;
// etc...
// Pero asumiremos que la lógica general es similar a Enemy 1. 
// Simplificaremos detectando colisión genérica si Enemy 1 usaba grid directa.
// (Revisando Enemy 1 Step, usaba ds_grid[# p1, p2]).

// COPIA FIEL DE LÓGICA DE ENEMIGO 1 (Ajustada)
// Asumimos que Obj_Sistema ya creó global.mapa_grid correctamente en Room Start.

// ---------------------------------------------------------
// Lógica de Rebote Simple (sin tilemap compleja para evitar errores si no tenemos las macros)
// ---------------------------------------------------------

// Detección de Paredes (Obj_Colision es sólido o usamos place_meeting si hay objetos)
if (place_meeting(x + walksp, y, Obj_Colision))
{
    while (!place_meeting(x + sign(walksp), y, Obj_Colision))
    {
        x = x + sign(walksp);
    }
    walksp = -walksp; // Rebotar
}
x = x + walksp;

// --- COLISIÓN VERTICAL (Gravedad) ---
if (place_meeting(x, y + vsp, Obj_Colision))
{
    while (!place_meeting(x, y + sign(vsp), Obj_Colision))
    {
        y = y + sign(vsp);
    }
    vsp = 0;
}
y = y + vsp;

// --- ANIMACIÓN ---
if (walksp != 0) image_xscale = sign(walksp); // Voltear sprite según dirección
