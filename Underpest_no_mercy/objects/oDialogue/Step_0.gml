var _node = dialogue[$ current_node];
var _is_choice = variable_struct_exists(_node, "choices");

if (typist.get_state() < 1)
{
    if (keyboard_check_pressed(vk_space)) typist.skip();
}
else if (_is_choice)   // finished typing AND has choices
{
    var _count = array_length(_node.choices);
    choice_index += keyboard_check_pressed(vk_down) - keyboard_check_pressed(vk_up);
    choice_index = (choice_index + _count) mod _count;   // wraps around

    if (keyboard_check_pressed(vk_space))
    {
        current_node = _node.choices[choice_index].goto;
        choice_index = 0;
        set_dialogue(current_node);
    }
}
else   // finished typing, linear node
{
    if (keyboard_check_pressed(vk_space))
    {
        var _next = _node.goto;
        if (_next != undefined)
        {
            current_node = _next;
            set_dialogue(current_node);
        }
    }
}