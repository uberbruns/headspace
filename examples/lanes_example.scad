// Example: lanes module
// Demonstrates dividing space along the Y axis (depth)

include <../headspace.scad>

// Example 1: Simple equal subdivision
in(space_new(width=100, depth=1000, height=100)) {
  lanes([FLEX(), FLEX()]) {
    paint("Pink", alpha=0.5)
      name("Lane") block();
  }
}

// Example 2: Fixed spacing between flexible sections
in(space_new(width=100, depth=1000, height=100)) move(top=150)  {
  lanes([FLEX(obj=0)], repeat=3, insert=[ABS(50)]) {
    // Creates: [FLEX(obj=0), 50, FLEX(obj=0), 50, FLEX(obj=0), 50]
    paint("LightGreen", alpha=0.5) block(); // 3 flexible sections, 50mm gaps unassigned
  }
}

// Example 3: Complex pattern with multiple children
in(space_new(width=100, depth=1000, height=100)) move(top=300)  {
  lanes([ABS(100, obj=0), FLEX(obj=1), ABS(100, obj=0)]) {
    paint("Orange", alpha=0.8) block();     // Both 100mm sections
    paint("Yellow", alpha=0.5) block();     // Center flexible section
  }
}
