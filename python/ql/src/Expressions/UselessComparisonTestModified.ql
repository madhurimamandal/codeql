/**
 * @name Negative of Redundant comparison
 * @description The result of a comparison is implied by a previous comparison.
 * @kind problem
 * @tags useless-code
 *       external/cwe/cwe-561
 *       external/cwe/cwe-570
 *       external/cwe/cwe-571
 * @problem.severity warning
 * @sub-severity high
 * @precision high
 * @id py/redundant-comparison
 */

import python
import IsComparisons

from Compare comp
where

    comp.getOp(0) instanceof Gt
    or
    comp.getOp(0) instanceof GtE
    or
    comp.getOp(0) instanceof Lt
    or
    comp.getOp(0) instanceof LtE
    or
    comp.getOp(0) instanceof Eq
    
select comp,
  "Values compared using " + comp.getOp(0).getSymbol() 
