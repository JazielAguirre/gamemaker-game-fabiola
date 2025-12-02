if(place_meeting(x, y, Obj_Player_A)&& !instance_exists(Obj_Animacion)){
	var animacion = instance_create_depth(0, 0, -9999, Obj_Animacion);
	
	animacion.pos_x = pos_x;
	animacion.pos_y = pos_y;
	animacion.pos_rm = pos_rm;
	animacion.pos_face = pos_face;
}