/**
 * @name Negative of Duplicate key in dict literal
 * @description Duplicate key in dict literal. All but the last will be lost.
 * @kind problem
 * @tags reliability
 *       useless-code
 *       external/cwe/cwe-561
 * @problem.severity warning
 * @sub-severity high
 * @precision very-high
 * @id py/duplicate-key-dict-literal
 */

import python
import semmle.python.strings

predicate dict_key(Dict d, Expr k, string s) {
  k = d.getAKey() and
  (
    s = k.(Num).getN()
    or
    // We use � to mark unrepresentable characters
    // so two instances of � may represent different strings in the source code
    not "�" = s.charAt(_) and
    exists(StrConst c | c = k |
      s = "u\"" + c.getText() + "\"" and c.isUnicode()
      or
      s = "b\"" + c.getText() + "\"" and not c.isUnicode()
    )
  )
}

from Dict d, Expr k1
where
  not exists(string s | dict_key(d, k1, s) )
select d, "Dictionary key"