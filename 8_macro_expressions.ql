import cpp

from MacroInvocation mi1
where mi1.getMacro().getName() in ["ntohs", "ntohl", "ntohll"]
select mi1.getExpr()

