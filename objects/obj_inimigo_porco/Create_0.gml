/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

// Inherit the parent event
event_inherited();

// personalizando as variaveis

// ele vai escolher para qual lado ele ira andar com a seguinte funcao:
vel = choose(1, -1);

estado = "normal";

andando = choose(false, true);

if(andando){
	velh = choose(vel,-vel);
	
}else{
	velh = 0;
}

//tempo_dicidir_andar = room_speed * 2;
tempo_didicir_andar = game_get_speed(gamespeed_fps) * 3;

