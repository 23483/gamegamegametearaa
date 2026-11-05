shader_type canvas_item;

uniform float saturation : hint_range(0.0, 1.0) = 0.3;

uniform sampler2D screen_texture : hint_screen_texture, filter_linear;

void fragment() {
	vec4 col = texture(screen_texture, SCREEN_UV);

	float grey = dot(col.rgb, vec3(0.299, 0.587, 0.114));

	vec3 result = mix(vec3(grey), col.rgb, saturation);

	COLOR = vec4(result, col.a);
}