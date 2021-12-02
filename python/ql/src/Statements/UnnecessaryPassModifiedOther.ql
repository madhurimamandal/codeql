/**
 * @name Negative of Unnecessary pass
 * @description Unnecessary 'pass' statement
 * @kind problem
 * @tags maintainability
 *       useless-code
 * @problem.severity warning
 * @sub-severity low
 * @precision very-high
 * @id py/unnecessary-pass
 */

import python


from Pass p, StmtList list
where
  list.getAnItem() = p

select p, "'pass' statement."
