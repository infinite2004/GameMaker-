draw_set_color(c_yellow);
draw_circle(circ1_x, circ1_y, circ1_r, true);

draw_set_color(c_yellow);
draw_circle(circ1_xone, circ1_yone, circ1_rone, true);

draw_set_color(c_blue);
draw_rectangle(rect_x, rect_y, rect_x + rect_width, rect_y + rect_height, true);

draw_set_color(c_olive);
draw_rectangle(rect_x, rect_y, rect_x - rect_width, rect_y + rect_height, true);

draw_set_color(c_green);
draw_rectangle(rect_x, rect_y, rect_x + rect_width + rect_width, rect_y + rect_height, true);

draw_set_color(c_green);
draw_rectangle(rect_xone, rect_yone, rect_xone + rect_widthone + rect_widthone, rect_yone + rect_heightone, true);

draw_set_color(c_yellow)
draw_set_alpha(0.5)
draw_ellipse(elispse_xone,elispse_yone,elispse_xtwo,elispse_ytwo,false)

draw_set_color(c_olive);
draw_triangle(tri_x1, tri_y1, tri_x2, tri_y2, tri_x3, tri_y3, true);
