/**
 * @name Negative of Incomplete ordering
 * @description Class defines one or more ordering method but does not define all 4 ordering comparison methods
 * @kind problem
 * @tags reliability
 *       correctness
 * @problem.severity warning
 * @sub-severity low
 * @precision very-high
 * @id py/incomplete-ordering
 */

import python

string ordering_name(int n) {
  result = "__lt__" and n = 1
  or
  result = "__le__" and n = 2
  or
  result = "__gt__" and n = 3
  or
  result = "__ge__" and n = 4
}

Value ordering_method(ClassValue c, string name) {
  name = ordering_name(_) and result = c.declaredAttribute(name)
}

from ClassValue c, Value ordering, string name
where
  not c.failedInference(_) and
  ordering = ordering_method(c, name)
select c,
  "Class " + c.getName() + " implements ordering methods.", ordering, name
