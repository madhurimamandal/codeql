/**
 * @name Negative of Non-callable called
 * @description A call to an object which is not a callable will raise a TypeError at runtime.
 * @kind problem
 * @tags reliability
 *       correctness
 *       types
 * @problem.severity error
 * @sub-severity high
 * @precision high
 * @id py/call-to-non-callable
 */

import python
import Exceptions.NotImplemented

from Call c, Value v, ClassValue t, Expr f, AstNode origin
where
  f = c.getFunc() and
  f.pointsTo(v, origin) and
  t = v.getClass() and
  t.isCallable() and
  not t.failedInference(_) and
  not t.hasAttribute("__get__") and
  not use_of_not_implemented_in_raise(_, f)
  select c, t.getClass() +  ":::Call to a $@ of $@.", origin, "callable", t, t.toString()
