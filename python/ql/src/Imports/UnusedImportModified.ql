/**
 * @name Negative of Unused import
 * @description Import is not required as it is not used
 * @kind problem
 * @tags maintainability
 *       useless-code
 * @problem.severity recommendation
 * @sub-severity high
 * @precision very-high
 * @id py/unused-import
 */

import python

from ImportExpr imp
where exists(string str | str = imp.getName())
select imp, "Imported module " + imp.getName()
