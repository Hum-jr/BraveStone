shader_type spatial;

uniform vec4 albedo : hint_color;
uniform sampler2D texture_albedo : hint_albedo;

void fragment() {
    vec4 albedo_tex = texture(texture_albedo, UV);
    ALBEDO = albedo.rgb * albedo_tex.rgb;
    float lambert = max(dot(NORMAL, LIGHT), 0.0);
    DIFFUSE_LIGHT += step(0.5, lambert) * LIGHT_COLOR;
}
