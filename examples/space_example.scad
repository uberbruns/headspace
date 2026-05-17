// Example: space_new function
// Demonstrates creating custom space definitions

include <../headspace.scad>

// Create a custom space at the origin
space1 = space_new(width=600, depth=400, height=800);

// Create a custom space with offset position
space2 = space_new(x=700, y=0, z=0, width=400, depth=300, height=600);

// Visualize the spaces
paint("LightBlue", alpha=0.3) {
  in(space1) name("Space 1") block();
}

paint("LightGreen", alpha=0.3) {
  in(space2) name("Space 2") block();
}
