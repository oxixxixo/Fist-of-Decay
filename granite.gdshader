shader_type canvas_item;

uniform sampler2D marble: filter_linear_mipmap;

void fragment() {
	int arrayLen = 3;
	vec3[3] array = {vec3(0.0), vec3(0.5), vec3(0.9)};
	vec4 tex = texture(marble,SCREEN_UV);
	COLOR = (COLOR.r > .9) ? 
				vec4(array[
					int(floor(tex.r*3.0))
				],tex.a) : 
				COLOR;
}
