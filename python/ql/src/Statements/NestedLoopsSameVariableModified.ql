/**
 * @name Negative of Nested loops with same variable
 * @description Nested loops in which the target variable is the same for each loop make
 *              the behavior of the loops difficult to understand.
 * @kind problem
 * @tags maintainability
 *       correctness
 * @problem.severity recommendation
 * @sub-severity high
 * @precision very-high
 * @id py/nested-loops-with-same-variable
 */

import python

predicate loop_variable(For f, Variable v) { f.getTarget().defines(v) }

predicate variableUsedInNestedLoops(For inner, For outer, Variable v1, Variable v2) {
  /* Only treat loops in body as inner loops. Loops in the else clause are ignored. */
  outer.getBody().contains(inner) and
  loop_variable(inner, v1) and
  loop_variable(outer, v2) and
  v1 != v2 
}

from For inner, For outer, Variable v1, Variable v2
where variableUsedInNestedLoops(inner, outer, v1, v2)
select inner, "Nested for statements don't have same loop variables.", outer,
  "for statement"
