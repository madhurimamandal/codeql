/** Provides classes for modifiers. */

import Element

/**
 * A modifier, for example `static`, `virtual`, `public` and so on.
 */
class Modifier extends Element, @modifier {
  /** Gets the name of this modifier, for example `public`. */
  string getName() { modifiers(this, result) }

  /** Holds if this modifier has name `name`. */
  predicate hasName(string name) { name = this.getName() }

  override string toString() { result = this.getName() }
}

/**
 * An access modifier: `public`, `private`, `internal` or `protected`.
 */
class AccessModifier extends Modifier {
  AccessModifier() {
    this.hasName("public") or
    this.hasName("private") or
    this.hasName("internal") or
    this.hasName("protected")
  }
}
