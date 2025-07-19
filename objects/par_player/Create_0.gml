
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
fire_cooldown = 0;

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
        else if(life <= 0){ // If life <= 0, go to dead state and destroy the instance
            state = PLAYER_STATE.DEATH;
        }
}

// Fire System Variables
actual_weapon = 0;
weapons_list = ds_list_create();
can_fire = true;
spaceship_weapon = function(_name,_pos_array,_obj,_dir_array,_speed,_cooldown) constructor {
    name = _name;
    pos_array = _pos_array;
    obj = _obj;
    dir_array = _dir_array;
    speed = _speed;
    cooldown = _cooldown;
}
// Find all weapons for the spaceship
find_weapons = function(_db){
    if(!ds_exists(_db,ds_type_map) || ds_map_empty(_db)){
        show_debug_message("Weapons database empty or not exists");
        return;
    }
    for(var i=0; i<ds_map_size(_db); i++){
        var _key = string(i);
        if(_db[? _key].allow_spaceship == spaceship_name){
            ds_list_add(weapons_list,_db[? _key]);
        }
    }
}

find_weapons(global.weapons_db);

check_direction_array = function(_list,_sht,_i){
    var _dir_array = _list[| actual_weapon].dir_array;
    var _pos_array = _list[| actual_weapon].pos_array;
    if(is_array(_dir_array)){
        if(array_length(_dir_array) != array_length(_pos_array)){
            show_debug_message("Direction array is not the same size as the position array!");
            _sht.dir = _dir_array[0];
            return;
        }
        _sht.dir = _dir_array[_i];
    }
        else{
            _sht.dir = _dir_array;
        }
}

// Fire system by the weapon is equiped
set_weapon_and_fire = function(_list){
    if(actual_weapon >= ds_list_size(_list) || ds_list_empty(_list)){
        show_debug_message("Index out of bounds or list empty");
        return;
    }
    if(fire && can_fire && fire_cooldown <= 0){
        var _array_h = array_length(_list[| actual_weapon].pos_array);
        if(fire_cooldown <= 0){
        for(var i=0; i<_array_h; i++){
            var _array_w = array_length(_list[| actual_weapon].pos_array[i]);
            var _pos_array = _list[| actual_weapon].pos_array[i];
            var _bullet = _list[| actual_weapon].obj;
            
                if(!is_array(_bullet)){
                    var _shoot = instance_create_layer(x+_pos_array[0],y+_pos_array[1],"Bullets",_bullet);
                    _shoot.spd = _list[| actual_weapon].speed;
                    check_direction_array(_list,_shoot,i);
                }
                for(var j=0; j<_array_w && is_array(_bullet); j++){
                    var _shoot = instance_create_layer(x+_pos_array[0],y+_pos_array[1],"Bullets",_bullet[i]);
                    _shoot.spd = _list[| actual_weapon].speed; 
                    _shoot.dir = _list[| actual_weapon].dir_array;
                    check_direction_array(_list,_shoot,i);
                }
                fire_cooldown = _list[| actual_weapon].cooldown;
            }
        }
    }
        else if(fire_cooldown > 0){
            fire_cooldown--;
        }
    // Things to do: Check if the bullets is a array and set different bullet
    // Define values to the bullet
}