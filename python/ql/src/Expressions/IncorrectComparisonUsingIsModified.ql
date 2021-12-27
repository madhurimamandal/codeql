/**
 * @name Negative of Comparison using is when operands support `__eq__`
 * @description Comparison using 'is' when equivalence is not the same as identity
 * @kind problem
 * @tags reliability
 *       correctness
 * @problem.severity warning
 * @sub-severity low
 * @precision high
 * @id py/comparison-using-is
 */

import python
import IsComparisons

from Compare comp, Cmpop op
where
( op = comp.getOp(0) 
  and 
  op instanceof Is
  or
  op instanceof IsNot
)
select comp,
"Values compared using '" + op.getSymbol()
