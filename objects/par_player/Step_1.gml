// Execute the script from array, that each state will be passed
// When a state is change by: state = PLAYER_STATE.IDLE(For example)
// This function will execute the script setted in array by enum
script_execute(state_array[state]);

// Execute set_inputs()
set_inputs(inputs.up,inputs.left,inputs.down,inputs.right,inputs.fire);
