if (variable_global_exists("just_transitioned") && global.just_transitioned) {
    // desactiva la máscara o invisible por 0.3 seg para evitar re-trigger
    collision_mask = 0;
    visible = false;
    alarm[0] = 18; // 18 steps ~= 0.3s si room_speed=60
    global.just_transitioned = undefined;
}
