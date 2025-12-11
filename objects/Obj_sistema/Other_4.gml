/// @description Generar Grid y Configurar Sala

// 1. RE-GENERAR MATRIZ DE COLISIÓN
// Es vital borrar la anterior si existe para no llenar la memoria
// Verificamos primero que no sea -1 y luego si es una grid válida
if (global.mapa_grid != -1) && (ds_exists(global.mapa_grid, ds_type_grid))
{
    ds_grid_destroy(global.mapa_grid);
}

// Configuración de celdas
var celda_tam = 32; 
var ancho_celdas = room_width div celda_tam;
var alto_celdas = room_height div celda_tam;

// Crear nueva matriz del tamaño de LA SALA ACTUAL
global.mapa_grid = ds_grid_create(ancho_celdas, alto_celdas);

// Escanear paredes (Obj_Colision)
for (var i = 0; i < ancho_celdas; i++) 
{
    for (var j = 0; j < alto_celdas; j++) 
    {
        var xx = (i * celda_tam) + (celda_tam / 2);
        var yy = (j * celda_tam) + (celda_tam / 2);
        
        if (position_meeting(xx, yy, Obj_Colision)) 
        {
            global.mapa_grid[# i, j] = 1; // Pared
        } 
        else 
        {
            global.mapa_grid[# i, j] = 0; // Aire
        }
    }
}
show_debug_message("Obj_Sistema: Grid regenerada para room " + room_get_name(room));

// 2. CONFIGURAR MÚSICA (Opcional, para prevenir errores de audio)
if (!audio_is_playing(snd_intro))
{
    audio_play_sound(snd_intro, 1, true);
}
