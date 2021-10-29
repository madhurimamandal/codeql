/**
 * @name Negative of Unused local variable
 * @description Local variable is defined but not used
 * @kind problem
 * @tags maintainability
 *       useless-code
 *       external/cwe/cwe-563
 * @problem.severity recommendation
 * @sub-severity high
 * @precision very-high
 * @id py/unused-local-variable
 */

import python
import Definition

from Name used, LocalVariable v
where
  exists(Definition def | def.getNode() = used |
  def.getVariable() = v)
select used, "Local variable " + v.getId()
