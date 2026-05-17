// Example: inset and size modules
// Demonstrates adjusting spaces with relative insets and absolute dimensions

include <../headspace.scad>

in(space_new(x=0, y=0, z=0, width=300, depth=300, height=300)) {
  // Example 1: Relative inset - shrink by 10mm on all sides
  paint("LightBlue", alpha=0.3) inset(left=10, right=10, front=10, back=10, top=10, bottom=10)
    push_name("Inset Example") block();

  // Example 2: Symmetric inset - shrink by 20mm total (10mm per side)
  move(right=350) paint("LightGreen", alpha=0.3) inset(width=20, depth=20, height=20)
    push_name("Symmetric Inset") block();

  // Example 3: Absolute size aligned to leading edge (bottom-left-front)
  move(back=350) paint("Pink", alpha=0.3) size(width=150, depth=150, height=150, alignment=[LEFT, FRONT, BOTTOM])
    push_name("Size Leading") block();

  // Example 4: Absolute size aligned to trailing edge (top-right-back)
  move(right=350, back=350) paint("Orange", alpha=0.3) size(width=150, depth=150, height=150, alignment=[RIGHT, BACK, TOP])
    push_name("Size Trailing") block();
}
