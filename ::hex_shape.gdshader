shader_type canvas_item;

uniform float radius = 0.5;

void fragment() {
	// Called for every pixel the material is visible on.
	//convert UV from 0-1 to -1-1 range
	vec2 uv = (UV - 0.5) * 2.0;
	
	//hex distance func
	vec2 abs_uv = abs(uv);
	float a = max(abs_uv.x * 0.866025 + abs_uv.y * 0.5, abs_uv.y);
	
	//discard pixels outrside the hex radius
	if (a > radius) {
		discard;
	}
	
	COLOR = texture(TEXTURE, UV);
	
}

//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}
