// Dialogue settings
text_margin = 5;
box_width = 800;
box_height = 100;
box_margin_bottom  = 10;
box_x = (display_get_gui_width() / 2) - box_width/2;
box_y = display_get_gui_height() - box_height - box_margin_bottom ;
wrap_width = box_width - text_margin * 2;

dialogue = {
    greeting:   { speaker: "Flowey", portrait: spr_player_idle_down, text: "Howdy! I'm [c_yellow]Flowey[/c].",												goto: "lost" },
    lost:       { speaker: "Flowey", portrait: spr_player_idle_down, text: "[shake]Golly[/shake] you look lost[delay,400].[delay,400].[delay,400].",        goto: "teach" },
    teach:      { speaker: "Flowey", portrait: spr_player_idle_down, text: "Do not be afraid, my child. Want to learn how things work?",
        choices: [
            { text: "Yes!",       goto: "yes_branch" },
            { text: "No thanks.", goto: "no_branch" },
        ],
    },
    yes_branch: { speaker: "Flowey", portrait: spr_player_idle_down, text: "Great! See that heart? That's your SOUL.",							goto: undefined },
    no_branch:  { speaker: "Flowey", portrait: spr_player_idle_down, text: "...How rude.",														goto: undefined },
};
choice_index = 0;
current_node = "greeting";
typist = scribble_typist();
typist.in(0.3, 0);
typist.sound_per_char([sndType_Blip], 1, 1);   // sound array, pitch min, pitch max
set_dialogue(current_node);
