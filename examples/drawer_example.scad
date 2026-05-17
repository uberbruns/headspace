// Example: drawer box
// Demonstrates creating a complete drawer box with five panels

include <../headspace.scad>

in(space_new(width=600, depth=400, height=150)) {
  name("Drawer") {
    paint("darkviolet") panel(FRONT) {
      inset(top=20, width=40, bottom=10) paint("papayawhip") {
        panel([LEFT, RIGHT, BOTTOM, BACK]);
      }
    }
  }
}
