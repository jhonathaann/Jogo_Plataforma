/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

velv += grav;

if(momento == "off"){
	
	sprite_index = spr_bomba;

}else if(momento == "on"){

	sprite_index = spr_bomba_on;
	
	// rodando o boom_timer
	if(boom_timer > 0){
		boom_timer--;
	}else{
		momento = "boom";
	}
}else if(momento == "boom"){
	
	// checando se ele ja mudou de sprite
	if(sprite_index != spr_bomba_boom){
		// se sim, é pq que acabei de chagr nesse estado
		sprite_index = spr_bomba_boom;
		image_index = 0;   // começando a animacao do 0
	}
	
	// se terminou a animacao, eu distruo a bomba. tirei 1 pq o image_index começa em 0 e o image_numer começa em 1
	if(image_index >= image_number-1){
		instance_destroy();
	}
	
	// checando se a bomba esta colidindo com o player no momento de boom
	var _player = instance_place(x,y,obj_player);
	
	if(_player){
		
		// todo o codigo que esta aqui dentro esta rodando dentro do player
		with(_player){
			dano = true; 
			timer_dano = tempo_dano;
			inv_timer = inv_tempo;
		}
	}
}