/**
 * @name Negative of Deprecated slice method
 * @description Defining special methods for slicing has been deprecated since Python 2.0.
 * @kind problem
 * @tags maintainability
 * @problem.severity warning
 * @sub-severity high
 * @precision very-high
 * @id py/deprecated-slice-method
 */

import python

predicate slice_method_name(string name) {
  name = "__getitem__" or name = "__setitem__" or name = "__delitem__"
}

from PythonFunctionValue f, string meth
where
  f.getScope().isMethod() and
  not f.isOverridingMethod() and
  slice_method_name(meth) and
  f.getName() = meth
select f, meth