/**
 * @name Negative of Testing equality to None
 * @description Testing whether an object is 'None' using the == operator is inefficient and potentially incorrect.
 * @kind problem
 * @tags efficiency
 *       maintainability
 * @problem.severity recommendation
 * @sub-severity high
 * @precision very-high
 * @id py/test-equals-none
 */

import python

from Compare c
where c.getOp(0) instanceof Is and c.getAComparator() instanceof None
select c, "Testing for None using the 'is' operator."
