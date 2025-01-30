/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

switch(estado){
	
	case "off":
		// codigo de quando ele estiver parado	
		
		muda_sprite(spr_canhao);
	
	break;
	
	case "on":
		// codigo de quando ele for atirar
		
		muda_sprite(spr_canhao_on);
		
		if(image_index >= image_number -1){
			estado = "off";
		}
	break;
	
}