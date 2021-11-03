/**
 * @name Negative of Module is imported more than once
 * @description Importing a module a second time has no effect and impairs readability
 * @kind problem
 * @tags maintainability
 *       useless-code
 * @problem.severity recommendation
 * @sub-severity high
 * @precision very-high
 * @id py/repeated-import
 */


import python

from ImportExpr imp
where exists(string str | str = imp.getName())
select imp, "Imported module " + imp.getName()
