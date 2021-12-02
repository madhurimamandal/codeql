/**
 * @name Negative of `__init__` method calls overridden method
 * @description Calling a method from `__init__` that is overridden by a subclass may result in a partially
 *              initialized instance being observed.
 * @kind problem
 * @tags reliability
 *       correctness
 * @problem.severity warning
 * @sub-severity low
 * @precision high
 * @id py/init-calls-subclass
 */

import python

from
  ClassObject supercls, Call call
where
  exists(FunctionObject init|
    supercls.declaredAttribute("__init__") = init and
    call.getScope() = init.getFunction() 
  )
select call, "Call inside __init__"
