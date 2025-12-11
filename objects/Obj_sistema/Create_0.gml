
// --- SINGLETON PATTERN ---
// Evita que existan 2 sistemas a la vez y el reloj vaya al doble de velocidad
if (instance_number(object_index) > 1)
{
    instance_destroy();
    exit;
}

//variables globales del juego
global.puntos=0; //score
global.monedas=0; //monedas recogidas 
global.vidas=3; //vida del player
global.mundo="1-1"; //nivel
global.tiempo=600; // segundos
global.powerup=false;
global.bono=false;




global.snd_salto=false;
global.snd_intro=false;
global.snd_items=false;
global.snd_muerte=false;

global.snd_muerte=false;

global.rm_inicio=Room1;
global.rm_gameover=Room2; // (Viejo Game Over, quizás lo dejemos por compatibilidad)

// --- NUEVOS MENÚS ---
// Asegúrate de crear estas ROOMS en tu carpeta Rooms
global.rm_menu = rm_menu; 
global.rm_gameover_final = rm_gameover_final; 

global.persistente=false;
global.juego_pausado=false;




alarm[0]=room_speed; //cuenta regresiva cada segundo


// ... (Aquí arriba está todo el código de tu equipo: vidas, audio, etc.) ...

audio_master_gain(1); // Esta es la última línea que me mostraste

// --- VARIABLES DE TRANSICIÓN (Game Over) ---
global.dead_transition = false; // ¿Está ocurriendo la animación de muerte?
global.trans_radius = 0;        // Radio del círculo
global.trans_target_room = -1;  // A qué sala ir después de la animación

// --- PREVENCIÓN DE ERRORES (GRID) ---
// Inicializamos la variable en -1 para que el evento Room Start no falle al leerla
global.mapa_grid = -1; 
global.surf_trans = -1; // Superficie para la transición circular

// NOTA: El código de la Grid se movió al evento "Room Start" (Other_4)
// para arreglar el bug de que no se actualizaba al reiniciar.