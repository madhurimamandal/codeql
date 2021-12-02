/**
 * @name Negative of `__eq__` not overridden when adding attributes
 * @description When adding new attributes to instances of a class, equality for that class needs to be defined.
 * @kind problem
 * @tags reliability
 *       correctness
 * @problem.severity warning
 * @sub-severity high
 * @precision high
 * @id py/missing-equals
 */

import python

from ClassValue cls
select cls,
  " class '" + cls.getName() 
