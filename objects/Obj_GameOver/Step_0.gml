/*if(keyboard_check_pressed)(vk_enter){
with(Obj_Sistema){
global.vidas=3;
}
room_goto(Rm_01);
}*/

// Efecto de aparición (fade in)
if (alpha_fondo < 1) {
    alpha_fondo += 0.02;
}