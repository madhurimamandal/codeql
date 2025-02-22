/**
 * @name Negative of NotImplemented is not an Exception
 * @description Using 'NotImplemented' as an exception will result in a type error.
 * @kind problem
 * @problem.severity warning
 * @sub-severity high
 * @precision very-high
 * @id py/raise-not-implemented
 * @tags reliability
 *       maintainability
 */

import python
import Exceptions.NotImplemented

from Expr notimpl
where use_of_not_implemented_error_in_raise(_, notimpl)
select notimpl, "NotImplementedError is an Exception."
