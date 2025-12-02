if(global.tiempo>0){
global.tiempo-=1;
alarm[0]=room_speed;
} else {
instance_destroy(Obj_Player_A);
game_restart();

}