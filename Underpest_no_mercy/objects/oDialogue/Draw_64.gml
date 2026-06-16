// Draw the text box
draw_sprite_stretched(sDialogueBackground, 0, box_x, box_y, box_width, box_height);
text.draw(box_x + text_margin, box_y + text_margin, typist);

var _node = dialogue[$ current_node];
if (variable_struct_exists(_node, "choices") && typist.get_state() >= 1)
{
    var _list = _node.choices;
	var _cx = box_x + text_margin;
	var _cy = box_y - 10 - array_length(_list) * 24;
    for (var _i = 0; _i < array_length(_list); _i++)
    {
        var _prefix = (_i == choice_index) ? "> " : "   ";
        draw_text(_cx, _cy + _i * 24, _prefix + _list[_i].text);
    }
} 