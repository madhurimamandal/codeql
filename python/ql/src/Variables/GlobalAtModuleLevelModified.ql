/**
 * @name Negative of Use of 'global' at module level
 * @description Use of the 'global' statement at module level
 * @kind problem
 * @tags maintainability
 *       useless-code
 * @problem.severity warning
 * @sub-severity low
 * @precision very-high
 * @id py/redundant-global-declaration
 */

import python

from Global g
where not g.getScope() instanceof Module
select g, "Declaring '" + g.getAName() + "global."
