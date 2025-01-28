/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

// se o porco esta usando a sprite de dano e a animacao acabou, ele morre
if(sprite_index == spr_inimigo_porco_dano){
	
	// isso aqui faz com que aquele objeto suma
	//instance_destroy();
	
	// indo para a sprite de morte
	// sprite_index = spr_inimigo_porco_morto;
	morto = true;
}

if(sprite_index == spr_inimigo_porco_morto){
	// eu quero que ele pare depois que ele morrer
	image_speed = 0;
	image_index = 3;  // indice do ultimo frame da animacao de morto do porco
}
