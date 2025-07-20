function player_state_spindash(){

	//Trigger peel out
	if(state == ST_LOOKDOWN && press_action)
	{
		animation_play(animator, ANIM_SPINDASH);
		play_sound(sfx_peelout_charge);
		// reset vars
		spindash_rev = 0;
		spindash_dust_frames = 0;
		
		state = ST_SPINDASH
	}
	
	//if its not peel out stop
	if(state != ST_SPINDASH) exit;
	
	// Draw spindash dust effect
//	if(!global.chaotix_dust_effect && state = ST_SPINDASH && ground)
//	{
//		draw_sprite_ext(spr_effect_spindash, spindash_dust_frames, floor(x) - 2 * facing, floor(y) + hitbox_h + 1, facing, 1, 0, c_white, 1);	
//	}

	// Animate dust effect
//	if(global.object_timer mod 3 == 0 && global.chaotix_dust_effect) 
//	{
//		create_effect(x - hitbox_w * facing, y + hitbox_h, spr_dust_effect, 0.4, depth-1, (3 * facing) * dcos(random_range(180, 270)), 3 * dsin(random_range(180, 270)));
//	}
	
	//Stop movement
	ground_speed = 0;
	
	//Change flags
	direction_allow = 1 - ground;
	movement_allow = 1 - ground;
	attacking = true;
	
	//Add rev value and clamp it
	spindash_rev += 1;
	spindash_rev = min(spindash_rev, 30);
	
	//Release the peel out
	if(!hold_down)
	{
		//Stop the peelout charge audio
		audio_stop_sound(sfx_peelout_charge);
		
		//Play the release sound
		play_sound(sfx_peelout_release);
		
		//Set player's speed and back to normal state
		ground_speed = (2+(spindash_rev / 2.9)) * facing;
		if(!ground)
		{
			x_speed = (2+(spindash_rev / 2.9)) * facing;
		}
		state = ST_ROLL;	
	}
}