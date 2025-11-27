//fuente color 
draw_set_font(fnt_Game);
draw_set_color(c_black);

//posicion del texto base
var x_posocion =35; //posicion en x 
var y_posicion=35; //posicion en y 
var espacio =150; //separacion de elementos 

//Dibujar el texto del HUD 
draw_text(x_posocion,y_posicion,"Puntaje:" + string_format(global.puntos,0,0));
draw_text(x_posocion + espacio * 1.5, y_posicion, "Items:" + string(global.monedas));
draw_text(x_posocion + espacio * 3, y_posicion,"Vidas:" + string(global.vidas));
draw_text(x_posocion + espacio * 4, y_posicion,"Mundo:" + string(global.mundo));
draw_text(x_posocion + espacio * 6, y_posicion,"Tiempo:" + string(global.tiempo));








