shader_type canvas_item;

uniform float velocidade = 0.5;

void fragment() {
	COLOR = texture(TEXTURE, vec2(UV.x + TIME * velocidade, UV.y));
}
