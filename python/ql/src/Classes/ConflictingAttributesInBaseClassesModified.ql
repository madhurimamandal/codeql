/**
 * @name Negative of conflicting attributes in base classes
 * @description When a class subclasses multiple base classes and more than one base class defines the same attribute, attribute overriding may result in unexpected behavior by instances of this class.
 * @kind problem
 * @tags reliability
 *       maintainability
 *       modularity
 * @problem.severity warning
 * @sub-severity low
 * @precision high
 * @id py/conflicting-attributes
 */

import python


from
  ClassObject c, ClassObject b1, ClassObject b2, int i1, int i2
where
  c.getBaseType(i1) = b1 and
  c.getBaseType(i2) = b2 and
  i1 < i2
select c, "Class has base classes"