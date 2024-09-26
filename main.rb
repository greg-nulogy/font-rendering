require "ruby2d"

set title: "Word wrap"

@text_to_render = "Some long text that might not fit on the screen"
@max_text_width = 200

def render_bounding_box
  Rectangle.new(
    x: 10, y: 10, width: @max_text_width, height: 300, color: 'purple', z: 1
  )
end

def render_text_width(text)
  Text.new(text.width, x: 510, y: 10, size: 20)
end

def render_text(text)
  Text.new(text, x: 10, y: 10, size: 20, z: 2)
end

rendered_text = render_text(@text_to_render)
render_text_width(rendered_text)
render_bounding_box

show

