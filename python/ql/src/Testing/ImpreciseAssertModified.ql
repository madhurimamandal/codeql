/**
 * @name Negative of imprecise assert
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

predicate callToPreciseAssertOnComparison(Call call, string assertName) {
  call.getFunc().(Attribute).getName() = assertName 
  
}

class CallToPreciseAssertOnComparison extends Call {
  CallToPreciseAssertOnComparison() { callToPreciseAssertOnComparison(this, _) }

  string getMethodName() { callToPreciseAssertOnComparison(this, result) }

  string getBetterName() {
    exists( |
      callToPreciseAssertOnComparison(this, "assertEqual") and

      (result = "assertEqual"
      )
      or
      callToPreciseAssertOnComparison(this, "assertNotEqual") and
      ( result = "assertNotEqual"
      )

    )

  }

}

from CallToPreciseAssertOnComparison call
where
  /* Exclude cases where an explicit message is provided*/
  not exists(call.getArg(1))
select call,
  call.getMethodName() + call.getBetterName()
