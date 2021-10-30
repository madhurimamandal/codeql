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
import MethodCallOrder

from ClassObject self, FunctionObject initializer,
FunctionObject missing, ClassObject b1, int i1
where
  self.lookupAttribute("__init__") = initializer and
  self.getBaseType(i1) = b1 and
  i1>0 and
  not missing.neverReturns() and
  not self.failedInference() and
  not missing.isBuiltin() and
  not self.isAbstract()
select self,
  "Class " + self.getName()
