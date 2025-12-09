
//variables globales del juego
global.puntos=0; //score
global.monedas=0; //monedas recogidas 
global.vidas=3; //vida del player
global.mundo="1-1"; //nivel
global.tiempo=300; // segundos
global.powerup=false;
global.bono=false;




global.snd_salto=false;
global.snd_intro=false;
global.snd_items=false;
global.snd_muerte=false;

global.rm_inicio=Room1;
global.rm_gameover=Room2;
global.persistente=false;
global.juego_pausado=false;




alarm[0]=room_speed; //cuenta regresiva cada segundo


// ... (Aquí arriba está todo el código de tu equipo: vidas, audio, etc.) ...

audio_master_gain(1); // Esta es la última línea que me mostraste

// --- AGREGADO: SISTEMA DE COLISIONES (MATRIZ) ---
// Esto escanea el nivel para que los enemigos (Patricia) sepan moverse

var celda_tam = 32; // Asegúrate que sea el tamaño de tu cuadrícula (grid)
var ancho_celdas = room_width div celda_tam;
var alto_celdas = room_height div celda_tam;

// Creamos la matriz global
global.mapa_grid = ds_grid_create(ancho_celdas, alto_celdas);

// Escaneamos la sala buscando 'Obj_Colision'
for (var i = 0; i < ancho_celdas; i++) 
{
    for (var j = 0; j < alto_celdas; j++) 
    {
        var xx = (i * celda_tam) + (celda_tam / 2);
        var yy = (j * celda_tam) + (celda_tam / 2);
        
        // Si encontramos el objeto pared de tu equipo
        if (position_meeting(xx, yy, Obj_Colision)) 
        {
            global.mapa_grid[# i, j] = 1; // 1 = Pared
        } 
        else 
        {
            global.mapa_grid[# i, j] = 0; // 0 = Aire
        }
    }
}

show_debug_message("Obj_Sistema: Matriz de colisiones generada correctamente.");