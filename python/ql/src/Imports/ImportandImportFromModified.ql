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

from Import imp
select imp, "Imported module "
