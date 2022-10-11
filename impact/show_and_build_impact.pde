



void impact_setup(R_Impact imp) {
	impact_build();	
	imp.pixel_mode(2);
	imp.use_mute(true);
	// print_setting();
}

void impact_draw() {
	if(use_pixels_is) {
		show_lines_pixel();
	} else {
		show_lines();
	}
}



// BUILD
/////////////////
void impact_build() {
	imp.build_struct(width/2, height/2);
	imp.set_pixels(0.3, r.RED);
	impact_build_polygon();

}

void impact_build_polygon() {
		set_mute_circle();
	//set_mute_main();
	imp.build_polygon();

}

// SHOW
////////////////////

// SHOW POLYGON
void show_polygon(int mode) {
	imp.show_polygon(mode);
}


// SHOW LINE
///////////////
void show_lines() {
	noFill();
	stroke(255);
	strokeWeight(1);
	// imp.show_line();
	// imp.show_line_main();
	// stroke(r.YELLOW);
	imp.show_line_circle();
	stroke(r.GREEN);
	imp.show_line_heart();

	if(show_error_is) {
		stroke(r.RED);
		imp.show_line_fail();
		stroke(r.WHITE);
		imp.show_bug();
	}
}

// SHOW PIXEL
/////////////
void show_lines_pixel() {
	imp.show_pixels_main(0.1, r.CYAN, r.CYAN, r.MAGENTA);
	imp.show_pixels_circle(0.1, r.MAGENTA, r.MAGENTA ,r.YELLOW);
	imp.show_pixels_heart(0.1, r.YELLOW, r.YELLOW, r.YELLOW, r.MAGENTA);
	// imp.show_pixels();
	// imp.show_pixels_main();
	// imp.show_pixels_circle();
	// imp.show_pixels_heart();
}


// SET MUTE
/////////////////

void set_mute_main() {
	int [] list_size = imp.get_size_main();
	for(int i = 0 ; i < imp.get_num_main() ; i++) {
		for(int k = 0 ; k < list_size[i] ; k++) {
			float choice = random(1);
			imp.set_mute_main(i, k, false);
			if(choice < 0.5) {
				imp.set_mute_main(i, k, true);
			}
		}
	}
}

void set_mute_circle() {
	int [] list_size = imp.get_size_circle();
	for(int i = 0 ; i < imp.get_num_circle() ; i++) {
		for(int k = 0 ; k < list_size[i] ; k++) {
			float choice = random(1);
			imp.set_mute_circle(i, k, false);
			if(choice < 0.5) {
				imp.set_mute_circle(i, k, true);
			}
		}
	}
}






