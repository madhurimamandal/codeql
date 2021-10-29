/**
 * @name Negative of Variable defined multiple times
 * @description Assignment to a variable occurs multiple times without any intermediate use of that variable
 * @kind problem
 * @tags maintainability
 *       useless-code
 *       external/cwe/cwe-563
 * @problem.severity warning
 * @sub-severity low
 * @precision very-high
 * @id py/multiple-definition
 */

import python
import Definition

predicate multiply_defined(AstNode asgn1, Variable v) {

  forex(Definition def|
    def.getVariable() = v and
    def = asgn1.getAFlowNode()
  )
}

predicate simple_literal(Expr e) {
  e.(Num).getN() = "0"
  or
  e instanceof NameConstant
  or
  e instanceof List and not exists(e.(List).getAnElt())
  or
  e instanceof Tuple and not exists(e.(Tuple).getAnElt())
  or
  e instanceof Dict and not exists(e.(Dict).getAKey())
  or
  e.(StrConst).getText() = ""
}

/**
 * A multiple definition is 'uninteresting' if it sets a variable to a
 * simple literal before reassigning it.
 * x = None
 * if cond:
 *     x = value1
 * else:
 *     x = value2
 */
predicate uninteresting_definition(AstNode asgn1) {
  exists(AssignStmt a | a.getATarget() = asgn1 | simple_literal(a.getValue()))
}

from AstNode asgn1, Variable v
where
  multiply_defined(asgn1, v) and
  not uninteresting_definition(asgn1)
select asgn1,
  "This assignment to '" + v.getId()