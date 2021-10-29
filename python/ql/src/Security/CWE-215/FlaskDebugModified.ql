/**
 * @name Negative of Flask app is run in debug mode
 * @description Running a Flask app in debug mode may allow an attacker to run arbitrary code through the Werkzeug debugger.
 * @kind problem
 * @problem.severity error
 * @security-severity 7.5
 * @precision high
 * @id py/flask-debug
 * @tags security
 *       external/cwe/cwe-215
 *       external/cwe/cwe-489
 */

import python
import semmle.python.dataflow.new.DataFlow
import semmle.python.ApiGraphs
import semmle.python.frameworks.Flask

/** Gets a reference to a truthy literal. */
private DataFlow::TypeTrackingNode truthyLiteral(DataFlow::TypeTracker t) {
  t.start() and
  result.asExpr().(ImmutableLiteral).booleanValue() = true
  or
  exists(DataFlow::TypeTracker t2 | result = truthyLiteral(t2).track(t2, t))
}


from DataFlow::CallCfgNode call
where
  call.getFunction() = Flask::FlaskApp::instance().getMember("run").getAUse() 
select call,
  "A Flask app is run in this line."
