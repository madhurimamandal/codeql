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
  CallToAssertOnComparison() { callToAssertOnComparison(this, "assertEqual") 
or 
callToAssertOnComparison(this, "assertNotEqual")

or
callToAssertOnComparison(this, "assertLess")

or
callToAssertOnComparison(this, "assertLessEqual")

or
callToAssertOnComparison(this, "assertGreater")

or
callToAssertOnComparison(this, "assertGreaterEqual")

or
callToAssertOnComparison(this, "assertIn")

or
callToAssertOnComparison(this, "assertNotIn")

or
callToAssertOnComparison(this, "assertIs")

or
callToAssertOnComparison(this, "assertIsNot")}


  string getMethodName() { callToAssertOnComparison(this, result) }
  
}

from CallToAssertOnComparison call
where
  exists(call.getArg(1))
select call,
  call.getMethodName() 