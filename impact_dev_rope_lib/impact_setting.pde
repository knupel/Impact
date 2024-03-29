// SET BUILD
//////////////////
void set_impact_pentagon() {
	set_heart(imp, 0.2);
	imp.normal();
}




void set_impact_classic() {
	// main
	int num_main = 12;
	int iter_main = 18;
	float growth_main = random(width/20,width/2);
	float angle_main = random(PI/120,PI/24);
	// circle
	int num_circle = 12;
	int iter_circle = num_main;
	float growth_circle = random(width/20,width/2);
	imp.normal();
	set_heart(imp, 0.2);
	imp.set_num_main(num_main).set_iter_main(iter_main).set_growth_main(growth_main).set_angle_main(angle_main);
	imp.set_num_circle(num_circle).set_iter_circle(iter_circle).set_growth_circle(growth_circle);
}

void set_impact() {
	//int max = 12;
	int max = 111;
	// int max = 200;
	// main
	int num_main = int(random(5,max));
	int iter_main = int(random(5,max));
	float growth_main = random(width/20,width/2);
	float angle_main = random(PI/120,PI/24);
	// circle
	int num_circle = int(random(5,max));
	int iter_circle = int(random(5,num_main));
	float growth_circle = random(width/20,width/2);
	imp.normal();
	set_heart(imp, 0.2);
	imp.set_num_main(num_main).set_iter_main(iter_main).set_growth_main(growth_main).set_angle_main(angle_main);
	imp.set_num_circle(num_circle).set_iter_circle(iter_circle).set_growth_circle(growth_circle);
}


void set_spiral() {
	// int max = 27;
	int max = 111;

	// main 
	int num_main = int(random(5,max));
	int iter_main = int(random(5,max));
	float growth_main = random(width/20,width/2);
	float angle_main = random(PI/120,PI/24);
	// circle
	int num_circle = 1;
	// int iter_circle = num_main * 10;
	int iter_circle = int(random(100,1200));
	float growth_circle = random(width/20,width/2);
	float factor_spiral_growth = random(0.1,6.0);
	// factor_spiral_growth = 12.0;
	imp.growth_factor_spiral(factor_spiral_growth);

	imp.spiral();
	set_heart(imp, 0.2);
	imp.set_num_main(num_main).set_iter_main(iter_main).set_growth_main(growth_main).set_angle_main(angle_main);
	imp.set_num_circle(num_circle).set_iter_circle(iter_circle).set_growth_circle(growth_circle);
}




// PRINT
///////////////////////
void print_setting() {
	println("====================================");
	if(imp.get_mode() == r.SPIRAL) {
		println("SPIRAL SETTING");
	} else {
		println("NORMAL SETTING");
	}
	println("----------------------------------");
	println("main num main", imp.get_num_main());
	println("main iteration", imp.get_iter_main());
	println("main growth", imp.get_growth_main());
	println("main angle", imp.get_angle_main());
	println("----------------------------------");
	println("circle num", imp.get_num_circle());
	println("circle iteration", imp.get_iter_circle());
	println("circle growth", imp.get_growth_circle());
	if(imp.get_mode() == r.SPIRAL) {
		println("----------------------------------");
		println("spiral growth", imp.get_growth_spiral());
	}
	// println("----------------------------------");
	// println("main iteration by branch");
	// println(imp.get_size_main());
	println("----------------------------------");
	// println("circle iteration by ring");
	// println(imp.get_size_circle());
	for(int i = 0 ; i < imp.get_num_circle() ; i++) {
		for(R_Line2D line : imp.get_lines_circle(i)) {
			println(i, line);
		}
	}
}



void set_heart(R_Impact imp , float threshold) {
	float heart = random(1);
	if(heart < threshold) {
		imp.heart_is(false);
	} else {
		imp.heart_is(true);
	}
}
