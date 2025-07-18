// Set weapon by variable
//actual_weapon = weapon[weapon_index];
set_weapon_and_fire(weapons_list);

#region DEBUG
// Check if the weapon trade is working
if(keyboard_check_pressed(ord("K"))){
    if(actual_weapon >= ds_list_size(weapons_list)-1){
        actual_weapon = 0;
    }
        else{
            actual_weapon++;
        }
}
#endregion