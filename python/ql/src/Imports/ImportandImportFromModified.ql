/**
 * @name Negative of Module is imported with 'import' and 'import from'
 * @description A module is imported with the "import" and "import from" statements
 * @kind problem
 * @tags maintainability
 * @problem.severity recommendation
 * @sub-severity low
 * @precision very-high
 * @id py/import-and-import-from
 */


import python

from ImportExpr imp
where exists(string str | str = imp.getName())
select imp, "Imported module " + imp.getName()
