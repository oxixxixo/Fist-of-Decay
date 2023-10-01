shader_type canvas_item;

uniform sampler2D marble: filter_linear_mipmap;
uniform float thresh = 0.2;

void fragment() {
	COLOR = (COLOR.b < thresh) ? COLOR*texture(marble,SCREEN_UV): COLOR;
}
