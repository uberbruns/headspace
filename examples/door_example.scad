// Example: door panel
// Demonstrates creating a cabinet with door panel using tolerance gaps

include <../headspace.scad>

in(space_new(width=600, depth=400, height=800)) {
  // Create cabinet box
  paint("papayawhip") panel([BOTTOM, TOP, LEFT, RIGHT, BACK]) {
    // Create door with 3mm tolerance gap
    inset(width=3, height=3) {
      paint("darkviolet") panel(FRONT);
    }
  }
}
