require "ruby2d"

set title: "Word wrap"

@initial_text = "Some long text that might not fit on the screen"
@max_text_width = 200

def render_bounding_box
  Rectangle.new(
    x: 10, y: 10, width: @max_text_width, height: 300, color: 'purple', z: 1
  )
end

def render_text_width(lines)
  size = 20
  lines.each_with_index do |line, index|
    Text.new(line.width, x: 510, y: 10 + size * index, size: size)
  end
end

def render_text(lines)
  size = 20
  rendered_lines = []
  lines.each_with_index do |line, index|
    rendered_lines.push(Text.new(line, x: 10, y: 10 + size * index, size: size, z: 2))
  end
  rendered_lines
end

def format_text(initial_text, _max_width)
  words = initial_text.split(' ')

  # Some
  # Some long
  # Some long text
  # ...
  # Some long text that might <-- doesn't fit
  # Some long text that\nmight not fit on the <-- doesn't fit
  # Some long text that\nmight not fit on\nthe screen
  # ^^ return this thing

  ["Some long text that", "might not fit on the", "screen"]

end

@text_to_render = format_text(@initial_text, @max_text_width)

rendered_text = render_text(@text_to_render)
render_text_width(rendered_text)
render_bounding_box

show

