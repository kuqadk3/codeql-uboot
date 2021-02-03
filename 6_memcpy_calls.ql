import cpp

// from Function f1, FunctionCall fc1
// where f1.getName() = "memcpy" and fc1.getTarget() = f1
// select fc1

from FunctionCall fc1
where fc1.getTarget().getName() = "memcpy"
select fc1
