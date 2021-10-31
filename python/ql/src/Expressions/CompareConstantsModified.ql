/**
 * @name Negative of Comparison of constants
 * @description Comparison of constants is always constant, but is harder to read than a simple constant.
 * @kind problem
 * @tags maintainability
 *       useless-code
 *       external/cwe/cwe-570
 *       external/cwe/cwe-571
 * @problem.severity warning
 * @sub-severity low
 * @precision very-high
 * @id py/comparison-of-constants
 */

import python

from Compare comparison, Expr left, Expr right
where
  comparison.compares(left, _, right) and
  not(
  left.isConstant() and
  right.isConstant()) and
  not exists(Assert a | a.getTest() = comparison)
select comparison, "Not comparison of constants."
