if(!audio_is_playing(snd_intro)){
audio_play_sound(snd_intro,1,true);
}

//volumen inicial

audio_master_gain(1);


/*if(global.vidas==0){
with(Obj_Player){
instance_destroy();
}
with(Obj_Goomba){
instance_destroy();
}
with(Obj_Bowser){
instance_destroy();
}
}
*/
//manejo de sonido
if(global.snd_salto==true){
audio_play_sound(Snd_Salto,1,false);
global.snd_salto=false;

}
/*
if(global.Snd_Coin==true){
audio_play_sound(Snd_Coin,1,false);
global.Snd_Coin=false;

}

if(global.Snd_Muerte==false){
audio_play_sound(Snd_Muerte,1,false);
global.Snd_Muerte=false;

}