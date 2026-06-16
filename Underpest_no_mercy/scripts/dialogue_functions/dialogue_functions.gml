function set_dialogue(_name){
    var _line = dialogue[$ _name];
    text = scribble(_line.text);
    text.wrap(wrap_width);
    typist.reset();
}