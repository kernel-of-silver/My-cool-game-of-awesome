function player_states(){	
	//Default flags:
	if(flag_override)
	{
		direction_allow = true;
		movement_allow = true;
		collision_allow = true;
		attacking = false;
		gravity_allow = true;
		hitbox_allow = true;
	}
	
	//State allowing flags:
	can_jump = false;
	can_roll = false;
	
	//Sonic states:
	player_state_spindash();
	
	//Tails states:
	player_state_tailsfly();
	
	//Common states:
	player_state_normal();
	player_state_jump();
	player_state_roll();
	player_state_lookdown();
	player_state_lookup();
	player_state_spring();
	player_state_skid();
	player_state_knockout();
	
	//Tails object
	player_handle_tails();
}