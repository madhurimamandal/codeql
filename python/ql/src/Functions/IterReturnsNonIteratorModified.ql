/**
 * @name Negative of `__iter__` method returns a non-iterator
 * @description The `__iter__` method returns a non-iterator which, if used in a 'for' loop, would raise a 'TypeError'.
 * @kind problem
 * @tags reliability
 *       correctness
 * @problem.severity error
 * @sub-severity low
 * @precision high
 * @id py/iter-returns-non-iterator
 */

import python

from ClassValue iterable, FunctionValue iter, ClassValue iterator
where
  iter = iterable.lookup("__iter__") and
  iterator = iter.getAnInferredReturnType() and
  iterator.isIterator()
select iterator,
  "Class " + iterator.getName(),
  iter, iter.getName()
