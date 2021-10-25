/**
 * @name Negative of wrong number of arguments in a call
 * @description Using too many or too few arguments in a call to a function will result in a TypeError at runtime.
 * @kind problem
 * @tags reliability
 *       correctness
 *       external/cwe/cwe-685
 * @problem.severity error
 * @sub-severity low
 * @precision very-high
 * @id py/call/wrong-arguments
 */

import python
import CallArgs

from Call call, FunctionValue func, int limit
where
  
  correct_args(call, func, limit)

  and

  not isAbstract(func) and
  not exists(FunctionValue overridden |
    func.overrides(overridden) and correct_args_if_called_as_method(call, overridden)
  ) and
  /* The semantics of `__new__` can be a bit subtle, so we simply exclude `__new__` methods */
  not func.getName() = "__new__"
select call, "Call to $@ with correct number of arguments", func,
  func.descriptiveString()
