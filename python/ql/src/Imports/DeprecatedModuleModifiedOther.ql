/**
 * @name Negative of Import of deprecated module
 * @description Import of a deprecated module
 * @kind problem
 * @tags maintainability
 *       external/cwe/cwe-477
 * @problem.severity warning
 * @sub-severity high
 * @precision very-high
 * @id py/import-deprecated-module
 */



import python

from Import imp
select imp, "Imported module "
