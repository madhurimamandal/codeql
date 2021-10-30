/**
 * @name Negative of Unnecessary 'else' clause in loop
 * @description An 'else' clause in a 'for' or 'while' statement that does not contain a 'break' is redundant.
 * @kind problem
 * @tags maintainability
 *       useless-code
 * @problem.severity warning
 * @sub-severity low
 * @precision very-high
 * @id py/redundant-else
 */

import python

from Stmt loop, StmtList body, StmtList clause, string kind
where
  (
    exists(For f | f = loop | clause = f.getOrelse() and body = f.getBody() and kind = "for")
    or
    exists(While w | w = loop | clause = w.getOrelse() and body = w.getBody() and kind = "while")
  ) 
select loop,
  "This '" + kind + "' statement has a 'else' present in the body."
