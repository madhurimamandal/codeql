/**
 * @name Negative of Incomplete URL substring sanitization
 * @description Security checks on the substrings of an unparsed URL are often vulnerable to bypassing.
 * @kind problem
 * @problem.severity warning
 * @security-severity 7.8
 * @precision high
 * @id py/incomplete-url-substring-sanitization
 * @tags correctness
 *       security
 *       external/cwe/cwe-20
 */

import python
import semmle.python.regex

private string commonTopLevelDomainRegex() { result = "com|org|edu|gov|uk|net|io" }


from StrConst s
where exists(string text | text = s.getText() |
text.regexpMatch("(?i)([a-z]*:?//)?\\.?([a-z0-9-]+\\.)+(" + commonTopLevelDomainRegex() +
    ")(:[0-9]+)?/?")
or
// target is a HTTP URL to a domain on any TLD
text.regexpMatch("(?i)https?://([a-z0-9-]+\\.)+([a-z]+)(:[0-9]+)?/?")
)
select s, s.getText()
