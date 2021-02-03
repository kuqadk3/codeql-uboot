import cpp

class NetworkByteSwap extends Expr {
  NetworkByteSwap () {
    // TODO: replace <class> and <var>
    exists(MacroInvocation mi1 | mi1.getMacro().getName() in ["ntohs", "ntohl", "ntohll"] and this = mi1.getExpr())
  } 
}

from NetworkByteSwap n
select n, "Network byte swap" 
