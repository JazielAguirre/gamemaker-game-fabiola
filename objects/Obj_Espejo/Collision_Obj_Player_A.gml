// 1. Aumentar el PUNTAJE (+10)
global.puntos += 10;

// 2. Reproducir un sonido de moneda (si tienes uno)
//audio_play_sound(Snd_Coin, 1, false);

// 3. Destruir la instancia de la moneda
instance_destroy();