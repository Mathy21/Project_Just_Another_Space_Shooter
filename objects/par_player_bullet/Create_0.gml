// Movement
// All this value is need to be set by the weapon
// DONT CHANGE THIS, CHANGE ON: sc_weapon_database
spd = 1;
hspd = 0;
vspd = 0;
dir = 0;

// State machine
enum BULLET_STATE {
    RESET,
    MOVING,
    DESTROY
}

state = BULLET_STATE.RESET;
state_array[BULLET_STATE.RESET] = bullet_reset_state;
state_array[BULLET_STATE.MOVING] = bullet_moving_state;
state_array[BULLET_STATE.DESTROY] = bullet_destroy_state;

// Destroy this object when the bullet is outside room
destroy_outside_room = function(){
    var _min_x,_max_x,_min_y,_max_y;
    _min_x = 0;
    _max_x = room_width;
    _min_y = 0;
    _max_y = room_height;
    if(x < _min_x || x > _max_x || y < _min_y || y > _max_y){
        instance_destroy(id, false);
    }
}

