/**
 * @name Negative of Inconsistent equality and hashing
 * @description Defining equality for a class without also defining hashability (or vice-versa) violates the object model.
 * @kind problem
 * @tags reliability
 *       correctness
 *       external/cwe/cwe-581
 * @problem.severity warning
 * @sub-severity high
 * @precision very-high
 * @id py/equals-hash-mismatch
 */

import python

CallableValue implemented(ClassValue c, string name) {
  result = c.declaredAttribute(name)
}


from ClassValue c,  string present1, 
CallableValue method
where
method = implemented(c, present1) and
not c.failedInference(_)

select method, "Class $@ implements " + present1, c,
  c.getName()