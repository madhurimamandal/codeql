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

from ClassObject self
select self,
  "Class " + self.getName()
