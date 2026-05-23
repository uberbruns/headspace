// Example: rows module
// Demonstrates dividing space along the Z axis (height)

include <../headspace.scad>

// Example 1: Simple equal subdivision
in(space_new(width=100, depth=100, height=1000)) {
  rows([FLEX(), FLEX(), FLEX(), FLEX()]) {
    paint("LightGreen", alpha=0.5) name("Row") block();
  }
}

// Example 2: Weighted flexible sections
in(space_new(width=100, depth=100, height=1000)) move(right=150) {
  rows([FLEX(weight=1), FLEX(weight=2), FLEX(weight=1)]) {
    paint("Pink", alpha=0.5) block();    // 1/4 of space
    paint("Orange", alpha=0.5) block();  // 2/4 of space
    paint("Yellow", alpha=0.5) block();  // 1/4 of space
  }
}

// Example 3: Shelves with dividers (bottom shelf reuses outer panel)
in(space_new(width=100, depth=100, height=1000)) move(right=300) {
  material(MDF(16)) {
    panel([BOTTOM, TOP, LEFT, RIGHT]) {
      rows([FLEX()], repeat=3, insert=[DIV(i=0)]) {
        paint("LightBlue", alpha=0.5) panel(BOTTOM); // Shelves
      }
    }
  }
}
