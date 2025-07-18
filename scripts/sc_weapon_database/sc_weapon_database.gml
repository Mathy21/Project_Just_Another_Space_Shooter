// Why using ds_map?
// Ds_map is expensive and heavy compared to ds_grid, but it's better
// to make databases, because it's more readeble, easy to add things
// and most importantly, easy to get and set things :P, for this scenery
// ds_map is better, beauty and hot :O
global.weapons_db = ds_map_create();

function weapon(_num,_name,_pos_array,_obj,_dir_array,_speed,_allow_spaceship,_cooldown) constructor {
    num = _num;
    name = _name;
    pos_array = _pos_array;
    obj = _obj;
    dir_array = _dir_array;
    speed = _speed;
    allow_spaceship = _allow_spaceship;
    cooldown = _cooldown;
}

function new_weapon(_struct){
        // The key is the num passed on struct
        var _key = string(_struct.num);
        // Add weapon struct to the ds_map by key passed above
        ds_map_add(global.weapons_db,_key,_struct);
}

// Add new weapons on database
// Position array default rules: 
// - first element=center,after this: right side
//                        after this: left side
//                        after this: others
// But it's not necessary to follow this rule, it's just for help
// - Array sequence:[x axis, y axis], for x: negative values, go left
//                                    for y: negative value, go up  
// - The number that will set in array, is'nt the exactaly position
// but this is the value that will sum with the center spaceship position
// Example: The ship has=32x32 px, so, the middle is 16x16. So, If you set
// [0,-6], the bullet will create on exactly x=16 and y=16+(-6)=10

// Speed: This is per default a int value, but, it can be a array instead
// If speed is a array, the array size MUST be the same as position array size
new_weapon(new weapon(0,"PlaceHolderGun",[[0,-6],[12,8],[-12,8]],
                      obj_placeholderShip_bullet,90,3,"placeholdership",15));

new_weapon(new weapon(1,"TomaGap",[[0,-6],[4,-4],[-4,-4]],
                      obj_placeholderShip_bullet,0,3,"placeholdership",10));