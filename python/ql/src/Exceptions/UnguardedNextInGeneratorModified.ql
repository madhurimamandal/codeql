/**
 * @name Negative of Unguarded next in generator
 * @description Calling next() in a generator may cause unintended early termination of an iteration.
 * @kind problem
 * @tags maintainability
 *       portability
 * @problem.severity warning
 * @sub-severity low
 * @precision very-high
 * @id py/unguarded-next-in-generator
 */

import python

BuiltinFunctionValue next() { result = Value::named("next") }

predicate call_to_next(CallNode call, ControlFlowNode iter) {
  iter = next().getArgumentForCall(call, 0)
}

from CallNode call
where
  call_to_next(call, _) 
select call, "Call to next() in a generator"
