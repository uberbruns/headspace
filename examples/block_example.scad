// Example: block module
// Demonstrates filling a space with a solid cube

include <../headspace.scad>

in(space_new(width=100, depth=100, height=100)) {
  paint("LightBlue", alpha=0.3) name("Interior Block") block();
}
