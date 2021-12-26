/**
 * @name Negative of Missing call to `__init__` during object initialization
 * @description An omitted call to a super-class `__init__` method may lead to objects of this class not being fully initialized.
 * @kind problem
 * @tags reliability
 *       correctness
 * @problem.severity error
 * @sub-severity low
 * @precision high
 * @id py/missing-call-to-init
 */

import python

from ClassObject self, Module module_scope
where
  self.getPyClass().getEnclosingScope() = module_scope and
  self.getPyClass().getLocation().getFile() = module_scope.getFile()
select self, "Class " + self.getQualifiedName()
