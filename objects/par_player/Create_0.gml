// Main
life = 0;

// Movement
spd = 2;
hspd = 0;
vspd = 0;

// State Machine
// Enum basically set states number by readble names like: RESET = 0, IDLE = 0, etc.
enum PLAYER_STATE {
    RESET,
    IDLE,
    MOVING,
    DEATH
}
// State and state array basiclly set: state = actual state
// state_array = all states functions(on state machine script) per enum number
// Where: RESET = 0, state_array[RESET] is the same thing that: state_array[0]
state = PLAYER_STATE.RESET;
state_array[PLAYER_STATE.RESET] = player_reset_state;
state_array[PLAYER_STATE.IDLE] = player_idle_state;
state_array[PLAYER_STATE.MOVING] = player_moving_state;
state_array[PLAYER_STATE.DEATH] = player_death_state;

// Inputs
// This struct set each key by struct variables
// Where ord get a char from keyboard, vk_key get the main keyboard keys
// from virtual keyboard, like: space, backspace, enter, etc.
inputs = {
    up: ord("W"),
    left: ord("A"),
    down: ord("S"),
    right: ord("D"),
    
    fire: vk_space
}

// Set the variables per key, up, left, down, right, etc.
// Which all variables will be set on a function that will execute per game frame
// on begin step. Doing this, allow in the future set a system that
// change the key, allowing player chaging each key on setting menu, for example.
up = 0;
left = 0;
down = 0;
right = 0;
fire = 0;
is_moving = 0;
is_firing = 0;

// This is the function that set each key, where this function
// Receive all inputs in arguments, setting the keyboard action
// **This must be analysed in the future for game control support
set_inputs = function(_up,_left,_down,_right,_fire){
    up = keyboard_check(_up);
    left = keyboard_check(_left);
    down = keyboard_check(_down);
    right = keyboard_check(_right);
    
    fire = keyboard_check(_fire);
    
    is_moving = up || left || right || down ? true : false;
    is_firing = fire ? true : false;
}

// Damage functions
// Here will be set when player receive damage
// Same function will be added on par_enemy
damage = function(_value){
    if(_value == undefined || _value <= 0){ // Just a bug avoid, if I forget to set
        life -= 1;                          // a value to damage, it will no crash :D
    }
    if(life > 0){
        life -= _value;
    } 
        else(life <= 0){ // If life <= 0, go to dead state and destroy the instance
                state = PLAYER_STATE.DEATH;
        }
}
