shader_type canvas_item;

uniform float speed = 0.01;

void vertex() {
	UV.y -= TIME * speed;
}