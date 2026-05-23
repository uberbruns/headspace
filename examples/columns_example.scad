// Example: columns module
// Demonstrates dividing space along the X axis (width)

include <../headspace.scad>

// Example 1: Simple equal subdivision
in(space_new(width=1000, depth=100, height=100)) {
  columns([FLEX(), FLEX(), FLEX()]) {
    paint("LightBlue", alpha=0.5) name("Column") block();
  }
}

// Example 2: Mixed absolute and flexible sections
move(top=150) in(space_new(width=1000, depth=100, height=100)) {
  columns([ABS(200), FLEX(), ABS(300)]) {
    paint("LightGreen", alpha=0.5) block(); // 200mm
    paint("Pink", alpha=0.5) block();       // Remaining
    paint("Orange", alpha=0.5) block();     // 300mm
  }
}

// Example 3: Using repeat and insert with i assignment
move(top=300) in(space_new(width=1000, depth=100, height=100)) {
  material(MDF(16)) {
    columns([FLEX(i=0)], repeat=4, insert=[DIV(i=1)]) {
      paint("LightBlue", alpha=0.5) block();  // 4 flexible sections
      paint("Gray", alpha=0.8) block();       // 3 dividers
    }
  }
}
