var _x,_y;
_x = view_wport[0];
_y = view_yport[0];

draw_set_halign(fa_center);
for(var i=0; i<ds_list_size(weapons_list); i++){
    var _string_h = string_height("T")
    draw_text(_x/2,_y+_string_h*i,weapons_list[| i]);
}
draw_set_halign(fa_left);