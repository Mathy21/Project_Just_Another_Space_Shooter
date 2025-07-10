function player_reset_state(){
    hspd = 0;
    vspd = 0;
    
    state = PLAYER_STATE.IDLE;
}

function player_idle_state(){
    hspd = 0;
    vspd = 0;
    
    if(is_moving){
        state = PLAYER_STATE.MOVING;
    }
}

function player_moving_state(){
    if(is_moving){
        var _dir = point_direction(0,0,(right-left),(down-up));
        hspd = lengthdir_x(spd,_dir);
        vspd = lengthdir_y(spd,_dir);
    }
        else{
            state = PLAYER_STATE.RESET;
        }
}

function player_death_state(){
    instance_destroy();
}