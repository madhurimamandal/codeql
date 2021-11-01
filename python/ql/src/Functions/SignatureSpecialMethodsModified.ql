/**
 * @name Negative of Special method has incorrect signature
 * @description Special method has incorrect signature
 * @kind problem
 * @tags reliability
 *       correctness
 * @problem.severity error
 * @sub-severity low
 * @precision high
 * @id py/special-method-wrong-signature
 */

import python

predicate is_unary_op(string name) {
  name = "__del__" or
  name = "__repr__" or
  name = "__str__" or
  name = "__hash__" or
  name = "__bool__" or
  name = "__nonzero__" or
  name = "__unicode__" or
  name = "__len__" or
  name = "__iter__" or
  name = "__reversed__" or
  name = "__neg__" or
  name = "__pos__" or
  name = "__abs__" or
  name = "__invert__" or
  name = "__complex__" or
  name = "__int__" or
  name = "__float__" or
  name = "__long__" or
  name = "__oct__" or
  name = "__hex__" or
  name = "__index__" or
  name = "__enter__"
}

predicate is_binary_op(string name) {
  name = "__lt__" or
  name = "__le__" or
  name = "__eq__" or
  name = "__ne__" or
  name = "__gt__" or
  name = "__ge__" or
  name = "__cmp__" or
  name = "__rcmp__" or
  name = "__getattr___" or
  name = "__getattribute___" or
  name = "__delattr__" or
  name = "__delete__" or
  name = "__instancecheck__" or
  name = "__subclasscheck__" or
  name = "__getitem__" or
  name = "__delitem__" or
  name = "__contains__" or
  name = "__add__" or
  name = "__sub__" or
  name = "__mul__" or
  name = "__floordiv__" or
  name = "__div__" or
  name = "__truediv__" or
  name = "__mod__" or
  name = "__divmod__" or
  name = "__lshift__" or
  name = "__rshift__" or
  name = "__and__" or
  name = "__xor__" or
  name = "__or__" or
  name = "__radd__" or
  name = "__rsub__" or
  name = "__rmul__" or
  name = "__rfloordiv__" or
  name = "__rdiv__" or
  name = "__rtruediv__" or
  name = "__rmod__" or
  name = "__rdivmod__" or
  name = "__rpow__" or
  name = "__rlshift__" or
  name = "__rrshift__" or
  name = "__rand__" or
  name = "__rxor__" or
  name = "__ror__" or
  name = "__iadd__" or
  name = "__isub__" or
  name = "__imul__" or
  name = "__ifloordiv__" or
  name = "__idiv__" or
  name = "__itruediv__" or
  name = "__imod__" or
  name = "__idivmod__" or
  name = "__ipow__" or
  name = "__ilshift__" or
  name = "__irshift__" or
  name = "__iand__" or
  name = "__ixor__" or
  name = "__ior__" or
  name = "__coerce__"
}

predicate is_ternary_op(string name) {
  name = "__setattr__" or
  name = "__set__" or
  name = "__setitem__" or
  name = "__getslice__" or
  name = "__delslice__"
}

predicate is_quad_op(string name) { name = "__setslice__" or name = "__exit__" }

from
  string name, ClassValue cls, PythonFunctionValue f
where
cls.declaredAttribute(name) = f and
(
  is_unary_op(name)
  or
  is_binary_op(name)
  or
  is_ternary_op(name)
  or
  is_quad_op(name)
)
  
select f, "Special method " + name