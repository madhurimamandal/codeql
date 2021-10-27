/**
 * @name Comparison using is when operands support `__eq__`
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

from Compare comp
where

    comp.getOp(0) instanceof Eq 
    
select comp,
  "Values compared using " + comp.getOp(0).getSymbol() 
