/// Moverse y Patrullar

// --- 1. APLICAR GRAVEDAD ---
vsp = vsp + grv;

// --- 2. COLISIÓN HORIZONTAL (Usando la Matriz Global) ---
var bbox_side;

// Determinar qué lado del enemigo revisar
if (hsp > 0) bbox_side = bbox_right; else bbox_side = bbox_left;

// Calcular coordenadas en la matriz
var p1 = (bbox_side + hsp) div TILE_SIZE;
var p2 = bbox_top div TILE_SIZE;
var p3 = bbox_bottom div TILE_SIZE;

// Si la matriz dice que hay pared (1) en esas coordenadas...
if (global.mapa_grid[# p1, p2] != 0) || (global.mapa_grid[# p1, p3] != 0)
{
    // Corregir posición para quedar pegado a la pared
    if (hsp > 0) x = x - (x % TILE_SIZE) + (TILE_SIZE - 1) - (bbox_right - x);
    else x = x - (x % TILE_SIZE) - (bbox_left - x);
    
    // ¡REBOTAR! (Cambiar dirección)
    hsp = -hsp;
}

// Aplicar movimiento
x = x + hsp;

// --- 3. COLISIÓN VERTICAL (Suelo) ---
if (vsp > 0) bbox_side = bbox_bottom; else bbox_side = bbox_top;
var p1 = (bbox_side + vsp) div TILE_SIZE;
var p2 = bbox_left div TILE_SIZE;
var p3 = bbox_right div TILE_SIZE;

if (global.mapa_grid[# p2, p1] != 0) || (global.mapa_grid[# p3, p1] != 0)
{
    if (vsp > 0) y = y - (y % TILE_SIZE) + (TILE_SIZE - 1) - (bbox_bottom - y);
    vsp = 0;
}

y = y + vsp;

// --- 4. ANIMACIÓN (Voltear Sprite) ---
if (hsp != 0) image_xscale = sign(hsp);