- do not spell-out the vector in documentation as it might change and consumers should not rely on its structure.

## Model Vector Storage Pattern

Models in `models/` use OpenSCAD vectors as their storage format. Each model type stores its properties as elements in a vector at fixed indices.

### Constructor Pattern

Each model provides a `*_new()` constructor function that takes property values as arguments and returns a vector. This is the canonical way to create model instances.

```
function modelname_new(prop1, prop2, ...) = [prop1, prop2, ...];
```

### Getter Pattern

Getters are functions named `modelname_propertyname()` that take a model vector and return the value at the corresponding index.

```
function modelname_propertyname(model) = model[INDEX];
```

### Setter Pattern

Setters are functions named `modelname_propertyname_set()` that take a model vector and a new value, returning a new model vector with the updated property. They use the constructor internally to ensure consistency.

```
function modelname_propertyname_set(model, value) =
  modelname_new(modelname_otherprop1(model), ..., value, ..., modelname_otherpropN(model));
```

Models are immutable; setters return new instances rather than modifying existing ones.

## Transformation Modules

Transformations in `transformations/` are OpenSCAD modules that modify the context and apply changes to their children.

### Pattern

Transformations wrap child modules and modify the context using the `update()` module. They use model getter and setter functions to create updated context instances.

```
module transformation_name(args) {
  update(context_property_set(context_current(), new_value)) children();
}
```

### Context Stack

Transformations operate on a context stack managed via `$context_stack`. The stack supports:

- `update(context)` - Replaces the current context with a new one
- `save()` - Pushes a copy of the current context onto the stack
- `restore()` - Pops the stack, reverting to the previous context

### Composition

Transformations compose by nesting. Inner transformations receive the context modified by outer transformations. Changes propagate down to children through OpenSCAD's special variable mechanism.

## File Structure and Naming Conventions

Source files across `models/`, `transformations/`, and `objects/` follow consistent structural and naming conventions.

### File Layout

Files are organized in the following order:

1. Header comment describing the file's purpose
2. Include statements for dependencies
3. Public modules and functions
4. Private helper functions and modules

### Public vs Private

- Public modules and functions use plain names (e.g., `columns`, `texture_new`).
- Private modules and functions are prefixed with an underscore (e.g., `_generate_repeated_sections`, `_render_child`).
- Private symbols are implementation details not intended for external use.

### Module Structure

Public modules typically:

- Accept configuration parameters with sensible defaults.
- Validate input and echo warnings for invalid usage.
- Delegate to private helpers for implementation details.
- Pass children through using `children()` or indexed `children(i)`.

```
module public_module(param = default) {
  // validation
  if (invalid) {
    echo("WARNING: ...");
  } else {
    // delegate to private implementation
    _private_helper(param) children();
  }
}
```

### Helper Functions

Private helper functions handle specific subtasks:

- Functions prefixed with `_` perform calculations or transformations.
- They are pure functions that return values without side effects.
- Complex logic is broken into small, focused helpers.

```
function _helper_function(input) = /* computation */;
```

### Helper Modules

Private helper modules encapsulate rendering logic:

- Modules prefixed with `_` handle iteration or conditional rendering.
- They set special variables (e.g., `$head`) for children to consume.

```
module _render_helper(data) {
  for (i = [0:len(data) - 1]) {
    $head = data[i];
    children();
  }
}
```