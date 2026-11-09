shader_type canvas_item;

uniform float vignette_strength : hint_range(0.0, 1.0) = 100;
uniform float vignette_size : hint_range(0.1, 1.0) = 5;

uniform float saturation : hint_range(0.0, 1.0) = 0.3;

uniform sampler2D screen_texture : hint_screen_texture, filter_linear;

void fragment() {
	vec4 col = texture(screen_texture, SCREEN_UV);

	float grey = dot(col.rgb, vec3(0.299, 0.587, 0.114));

	vec3 result = mix(vec3(grey), col.rgb, saturation);
	float dist = distance(SCREEN_UV, vec2(0.5));

	float edge = smoothstep(vignette_size * 0.4, vignette_size, dist);

	float shade = 1.0 - edge * vignette_strength;

result *= shade;
	COLOR = vec4(result, col.a);
}