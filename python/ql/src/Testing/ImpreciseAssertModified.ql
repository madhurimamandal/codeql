/**
 * @name Negative of Imprecise assert
 * @description Using 'assertTrue' or 'assertFalse' rather than a more specific assertion can give uninformative failure messages.
 * @kind problem
 * @tags maintainability
 *       testability
 * @problem.severity recommendation
 * @sub-severity high
 * @precision very-high
 * @id py/imprecise-assert
 */

import python

/* Helper predicate for CallToAssertOnComparison class */
predicate callToAssertOnComparison(Call call, string assertName) {
  call.getFunc().(Attribute).getName() = assertName  
  
}

class CallToAssertOnComparison extends Call {
  CallToAssertOnComparison() { callToAssertOnComparison(this, _) }


  string getMethodName() { callToAssertOnComparison(this, result) }
  
}

from CallToAssertOnComparison call
where
  /* Exclude cases where an explicit message is provided*/
  exists(call.getArg(1))
select call,
  call.getMethodName() 