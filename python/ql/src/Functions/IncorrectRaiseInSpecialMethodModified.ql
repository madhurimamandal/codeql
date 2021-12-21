/**
 * @name Negative of Non-standard exception raised in special method
 * @description Raising a non-standard exception in a special method alters the expected interface of that method.
 * @kind problem
 * @tags reliability
 *       maintainability
 *       convention
 * @problem.severity recommendation
 * @sub-severity high
 * @precision very-high
 * @id py/unexpected-raise-in-special-method
 */

import python

predicate always_raises(FunctionObject f, ClassObject ex) {
  ex = f.getARaisedType() 
}

from FunctionObject f, ClassObject cls
where
  always_raises(f, cls)
select f, "Function always raises $@; ", cls, cls.toString()
