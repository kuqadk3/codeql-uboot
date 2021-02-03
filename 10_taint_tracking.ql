/**
* @kind path-problem
*/

import cpp
import semmle.code.cpp.dataflow.TaintTracking
import DataFlow::PathGraph
 
class NetworkByteSwap extends Expr {
    NetworkByteSwap () {
      // TODO: replace <class> and <var>
      exists(MacroInvocation mi1 | mi1.getMacro().getName() in ["ntohs", "ntohl", "ntohll"] | this = mi1.getExpr())
    } 
  }
   
class Config extends TaintTracking::Configuration {
  Config() { this = "NetworkToMemFuncLength" }

  override predicate isSource(DataFlow::Node source) {
    // TODO
    source.asExpr() instanceof NetworkByteSwap
  }
  override predicate isSink(DataFlow::Node sink) {
    // TODO
    exists(FunctionCall fc1 | fc1.getTarget().getName() = "memcpy" | sink.asExpr() = fc1.getArgument(2))
  }
}

from Config cfg, DataFlow::PathNode source, DataFlow::PathNode sink
where cfg.hasFlowPath(source, sink)
select sink, source, sink, "Network byte swap flows to memcpy"
