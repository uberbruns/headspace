// Example: animated home office
// Same scene as homeoffice.scad, but steps the render depth through $t for animation

include <../headspace.scad>
include <../transformations/context.scad>

room = space_new(
  width=3500,
  depth=400,
  height=2300
);

render_depth = floor($t * 10);

OAK_DESKTOP = material_new("OakTop", 40, texture=texture_new("Tan", layer=2));
OAK_BACK = material_new("OakPanel", 8, texture=texture_new("Red", layer=2), veneer_texture=texture_new("Tan", layer=2), veneer_front=1);
MDF_BACK = material_new("OakPanel", 8, texture=texture_new("Blue", layer=2));
MULTIPLEX = material_new("Multiplex", 16, texture=texture_new("Tan", layer=2), veneer_texture=texture_new("WhiteSmoke", layer=2), veneer_front=1, veneer_back=1);

module foot() {
  name("Foot") {
    panel([LEFT, RIGHT, BACK]) inset(front=10) panel(FRONT);
  }
}

module bottom_storage() {
  name("Bottom Storage") {
    panel(BOTTOM) {
      panel(TOP, material=OAK_DESKTOP) {
        panel([LEFT, RIGHT]) panel(BACK, material=MDF_BACK) {
          inset(width=6, height=6) columns([FLEX(i=0)], repeat=2, insert=[3]) {
            material(MULTIPLEX) panel(FRONT);
          }
        }
      }
    }
  }
}

module open_compartment() {
  name("Open Compartment") {
    panel([TOP, LEFT, RIGHT]) material(OAK_BACK) panel(BACK);
  }
}

module top_storage() {
  name("Top Storage") {
    panel([TOP, LEFT, RIGHT]) panel(BACK, material=MDF_BACK) {
      columns([FLEX(i=0)], repeat=2, insert=[DIV(i=1)]) {
        material(MULTIPLEX) inset(width=6, height=6) panel(FRONT);
        panel(LEFT);
      }
    }
  }
}

module center() {
  name("Center") {
    rows([800, 700, FLEX()]) {
      panel(TOP, material=OAK_DESKTOP) panel(BACK);
      panel(TOP, material=OAK_DESKTOP) panel(BACK, material=OAK_BACK);
      panel([TOP]) panel(BACK, material=OAK_BACK) {
        material(OAK_DESKTOP) rows([FLEX()], repeat=2, insert=[DIV(i=0)]) {
          panel(TOP);
        }
      }
    }
  }
}

update(context_render_depth_set(context_current(), render_depth)) {
  in(room) material(MULTIPLEX) columns([FLEX(i=0), ABS(1400, i=1), FLEX(i=0)]) {
    // Sides
    rows([800, 700, FLEX()]) {
      // Bottom Storage
      rows([100, FLEX()]) {
        foot();
        bottom_storage();
      }
      // Open Compartment
      open_compartment();
      // Top Storage
      rows([FLEX()], repeat=2) {
        top_storage();
      }
    }
    // Center
    center();
  }
}
