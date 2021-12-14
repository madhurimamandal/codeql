/**
 * @name Negative of Modification of parameter with default
 * @description Modifying the default value of a parameter can lead to unexpected
 *              results.
 * @kind problem
 * @tags reliability
 *       maintainability
 * @problem.severity error
 * @sub-severity low
 * @precision high
 * @id py/modification-of-default-value
 */


import python

predicate assignment(AssignStmt a, Expr left, Expr right) {
  a.getATarget() = left and a.getValue() = right
}


from AssignStmt a, Expr left, Expr right
where
  assignment(a, left, right)
select a, "Assignment"
