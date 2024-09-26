require "ruby2d"

set title: "Word wrap"

@text_to_render = "Some long text that might not fit on the screen"

@text = Text.new(@text_to_render, x: 10, y: 10, size: 20)
@text.remove

width = @text.width

@width_text = Text.new(width, x: 10, y: 40, size: 20)

show