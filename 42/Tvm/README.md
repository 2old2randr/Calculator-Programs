# Time Value of Money

This is an HP solver program that can solve for any one of the
variables (PV, interest rate, payment, future value, number of 
payments) given the others.

The only interesting part of the program is that because it uses
LN(1+x) in the computation it can handle pathological cases where
the interest rate is very small.

It will run on any of HP 42s, DM 42 or Free42.
