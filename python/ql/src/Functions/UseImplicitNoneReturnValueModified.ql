/**
 * @name Negative of Use of the return value of a procedure
 * @description The return value of a procedure (a function that does not return a value) is used. This is confusing to the reader as the value (None) has no meaning.
 * @kind problem
 * @tags maintainability
 * @problem.severity warning
 * @sub-severity low
 * @precision high
 * @id py/procedure-return-value-used
 */

import python
import Testing.Mox

predicate is_used(Call c) {
  exists(Expr outer | outer != c and outer.containsInScope(c) |
    outer instanceof Call or outer instanceof Attribute or outer instanceof Subscript
  )
  or
  exists(Stmt s |
    c = s.getASubExpression() and
    not s instanceof ExprStmt and
    /* Ignore if a single return, as def f(): return g() is quite common. Covers implicit return in a lambda. */
    not (s instanceof Return and strictcount(Return r | r.getScope() = s.getScope()) = 1)
  )
}

from Call c, FunctionValue func
where
  /* Call result is used*/
  is_used(c) and
  c.getFunc().pointsTo(func) and
  not func.getScope().isProcedure() and
  forall(FunctionValue callee | c.getFunc().pointsTo(callee) | not callee.getScope().isProcedure())

select c, "The result of '$@' is used.", func, func.getQualifiedName()
