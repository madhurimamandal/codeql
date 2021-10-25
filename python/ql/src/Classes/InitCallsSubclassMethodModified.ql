/**
 * @name Helping to finding negative w.r.t `__init__` method calls overridden method
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
  ClassObject supercls, ClassObject sub, string method, Call call, 
  FunctionObject overridden
where
  exists(FunctionObject init, SelfAttribute sa |
    supercls.declaredAttribute("__init__") = init and
    call.getScope() = init.getFunction() and
    call.getFunc() = sa
  |
    sa.getName() = method and
    overridden = supercls.declaredAttribute(method)
    and 
    supercls = sub.getASuperType()
  )
select call, "Call to another function inside __init__"
