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

