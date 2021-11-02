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


from AstNode asgn1, AstNode asgn2, Variable v
where
exists(Definition def, Definition redef |
  def.getVariable() = v and
  def = asgn1.getAFlowNode() and
  redef = asgn2.getAFlowNode()
|
  not def.isUnused() and
  not def.getARedef() = redef and
  def.isRelevant()
)

select asgn1, v.getId()