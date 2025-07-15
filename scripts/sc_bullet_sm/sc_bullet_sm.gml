function bullet_reset_state(){
    hspd = 0;
    vspd = 0;
    
    state = BULLET_STATE.MOVING;
}

function bullet_moving_state(){
    hspd = lengthdir_x(spd,dir);
    vspd = lengthdir_y(spd,dir);
    
    if(place_meeting(x,y,par_enemy)){
        state = BULLET_STATE.DESTROY;
    }
}

function bullet_destroy_state(){
    instance_destroy();
}