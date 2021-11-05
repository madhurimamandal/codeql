/**
 * @name Negative of Modification of parameter with default
 * @description Modifying the default value of a parameter can lead to unexpected
 *              results.
 * @kind path-problem
 * @tags reliability
 *       maintainability
 * @problem.severity error
 * @sub-severity low
 * @precision high
 * @id py/modification-of-default-value
 */

import python

predicate assignment(AssignStmt a, Expr left, Expr right) {
  a.getATarget() = left and a.getValue() = right
}

predicate corresponding(Expr left, Expr right) {
  assignment(_, left, right)
  or
  exists(Attribute la, Attribute ra |
    corresponding(la, ra) and
    left = la.getObject() and
    right = ra.getObject()
  )
}

predicate maybe_defined_in_outer_scope(Name n) {
  exists(SsaVariable v | v.getAUse().getNode() = n | v.maybeUndefined())
}

predicate isBuiltin(string name) { exists(Value v | v = Value::named(name) and v.isBuiltin()) }

predicate same_name(Name n1, Name n2) {
  corresponding(n1, n2) and
  n1.getVariable() = n2.getVariable() and
  not isBuiltin(n1.getId()) and
  not maybe_defined_in_outer_scope(n2)
}

ClassValue value_type(Attribute a) { a.getObject().pointsTo().getClass() = result }

predicate is_property_access(Attribute a) {
  value_type(a).lookup(a.getName()) instanceof PropertyValue
}

predicate same_attribute(Attribute a1, Attribute a2) {
  corresponding(a1, a2) and
  a1.getName() = a2.getName() and
  same_value(a1.getObject(), a2.getObject()) and
  exists(value_type(a1)) and
  not is_property_access(a1)
}

predicate same_value(Expr left, Expr right) {
  same_name(left, right)
  or
  same_attribute(left, right)
}

from AssignStmt a, Expr left, Expr right
where
  assignment(a, left, right) and
  not same_value(left, right)
select a, "Assignment"

