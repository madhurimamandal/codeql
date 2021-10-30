/**
 * @name Negative of Implicit string concatenation in a list
 * @description Omitting a comma between strings causes implicit concatenation which is confusing in a list.
 * @kind problem
 * @tags reliability
 *       maintainability
 *       convention
 *       external/cwe/cwe-665
 * @problem.severity warning
 * @sub-severity high
 * @precision high
 * @id py/implicit-string-concatenation-in-list
 */

import python

predicate string_const(Expr s) {
  s instanceof StrConst
  or
  string_const(s.(BinaryExpr).getLeft()) and string_const(s.(BinaryExpr).getRight())
}

from StrConst s
where
  // Implicitly concatenated string is in a list and that list contains at least one other string.
  not exists(List l, Expr other |
    not s = other and
    l.getAnElt() = s and
    l.getAnElt() = other and
    string_const(other)
  ) or
  not exists(s.getAnImplicitlyConcatenatedPart()) or
   s.isParenthesized()
select s, "No implicit string concatenation"
