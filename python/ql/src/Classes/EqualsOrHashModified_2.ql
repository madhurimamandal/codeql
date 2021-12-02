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

CallableValue defines_equality(ClassValue c, string name) {
  (
    name = "__eq__"
    or
    major_version() = 2 and name = "__cmp__"
  ) and
  result = c.declaredAttribute(name)
}

CallableValue implemented_eq(ClassValue c, string name) {
  result = defines_equality(c, name)
  
}

CallableValue implemented_hash(ClassValue c, string name) {
  result = c.declaredAttribute("__hash__") and name = "__hash__"
}


from ClassValue c,  string present1, 
CallableValue method_eq, string present2, 
CallableValue method_hash
where
method_eq = implemented_eq(c, present1) and
method_hash = implemented_hash(c, present2) and
not c.failedInference(_)

select method_hash, "Class $@ implements " + present1 + "and" + present2, c,
  c.getName()