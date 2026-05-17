// Example: animated panel assembly
// Demonstrates progressively materializing panels around a central block using $t

include <../headspace.scad>

stage = floor($t * 6) % 6;

module head() {
  paint("darkviolet", alpha=0.4) inset(width=0.1, height=0.1, depth=0.1) name("Test") block();
}

in(space_new(x=-10, y=-10, z=-10, width=20, depth=20, height=20)) {
  material(MDF(stage >= 1 ? 2 : 0)) panel(LEFT)
  material(MDF(stage >= 2 ? 2 : 0)) panel(RIGHT)
  material(MDF(stage >= 3 ? 2 : 0)) panel(TOP)
  material(MDF(stage >= 4 ? 2 : 0)) panel(BOTTOM)
  material(MDF(stage >= 5 ? 2 : 0)) panel(BACK)
  head();
}
