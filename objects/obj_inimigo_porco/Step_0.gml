
if(morto){
	
	sprite_index = spr_inimigo_porco_morto;
	
	// fazendo o porco sumir se a sua animação acabou
	if(image_speed <= 0){
		image_alpha -= 0.01;
		
	}
	
	if(image_speed <= 0){
		// agora sim removendo o obj inimigo da cena
		instance_destroy();
	}
	exit;
}




// verificando se o porco esta no chao
var _chao = place_meeting(x, y+1, obj_chao);


if(estado == "normal"){
	
	// checando se o porco colidiu com a bomba e se ela estiver apagada
	var _bomba = instance_place(x,y, obj_bomba);
	
	if(_bomba){
		// checando se a bomba esta apagada
		if(_bomba.momento == "off"){
			estado = "fosforo";
		}
	}
	
	// se o porco estiver no chao, ele vai andar
	if(_chao){
	
		// diminuindo o tempo para decidir se eu vou andar
		tempo_didicir_andar -= 1;
	
		// se o tempo acabou, eu dedico se eu vou andar ou nao
		if(tempo_didicir_andar <= 0){
			// escolhendo entre verdadeiro e falço
			andando = choose(true, false);
		
			if(andando){
				// escolhendo novamente o lado no qual ele ira andar, se ele decidir andar
				velh = choose(vel,-vel);		
			}else{
				velh = 0;
			}
		
			// resetando o tempo
			tempo_didicir_andar = game_get_speed(gamespeed_fps) * 3;
		}
	
		// se isso acontecer, ele esta andando
		if(velh != 0 && dano == false){
		
			// mudando para a sprite de corrida
			sprite_index = spr_inimigo_porco_run;
		
			// e mudando tbm o lado para o qual ele olha
	
			image_xscale = sign(velh);
	
		}else{	
			sprite_index = spr_inimigo_porco_idle;
		}
	
		// se o porco bater na parede ele muda de direçao
		if(place_meeting(x+velh, y, obj_chao)){
		
			velh *= -1;
		}
	
		// se o porco nao pode cair, ent na hora em que ele for cair eu mudo de direçao
		if(pode_cair == false){
		
			// vericando se ele esta prestes a cair
			if(place_meeting(x + (velh*12), y + 1, obj_chao) == false){
				// se o porco nao pode cair E ele nao estiver tocando no chao na minha frente, ele muda de direçao
				velh *= -1;
			}
		}
	
	
	
	}else{
		// se o porco nao estiver no chao, vc aplica a gravidade nele
		velv += grav;
	
		//velh = 0;  sempre que o porco caia ele ficava parado
	
		if(velh != 0){
		
			image_xscale = sin(velh);
		}
	
	
	}
}

else if(estado == "fosforo"){
	// garantindo que a animção comece do 0
	if(sprite_index != spr_porco_fosforo){
		sprite_index = spr_porco_fosforo;
		image_index = 0;
	}
	
	velh = 0;
	
	// depois que ele ascendeu o fosforo ele 
	if(image_index >= image_number -1){
		estado = "fosforo_bomba";
	}
}
else if(estado == "fosforo_bomba"){
	
	if(sprite_index != spr_porco_fosforo_bomba){
		sprite_index = spr_porco_fosforo_bomba;
		image_index = 0;
	}
	
	// terminou a animacao
	if(image_index >= image_number -1){
		// ascende de fato a bomba
		var _bomba = instance_place(x,y, obj_bomba);
		
		if(_bomba){
			_bomba.momento = "on";
		}
		// voltando o porco ao seu estado normal
		estado = "normal";
	}

}


// o que vem por ultimo eh o que ele da mais prioridade na hora de executar

// checando se o porco esta tomando dano
if(dano && morto == false){
	
	// mudando a sprite
	sprite_index = spr_inimigo_porco_dano;
	velh = 0;

}


