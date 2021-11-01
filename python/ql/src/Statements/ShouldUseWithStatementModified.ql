/**
 * @name Negative of Should use a 'with' statement
 * @description Using a 'try-finally' block to ensure only that a resource is closed makes code more
 *              difficult to read.
 * @kind problem
 * @tags maintainability
 *       readability
 *       convention
 * @problem.severity recommendation
 * @sub-severity high
 * @precision very-high
 * @id py/should-use-with
 */

import python



from With w, Stmt open
where
  open = w.getStmt(0)
select w, "With statement"