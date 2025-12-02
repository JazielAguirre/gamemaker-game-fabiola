
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