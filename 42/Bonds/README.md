# Bond pricing program

Price a bond given yield or solve for yield given price.
Duration and convexity can also be computed.

The main program is in Bond.txt.

Supporting functions are in separate files
 - D2DMY.txt: extract day, month, year from a date
 - DMY2D.txt: convert day, month, year to date
 - NumDays.txt: compute number of days between two dates according to the specified day count basis
 - LcdNcd.txt: compute the coupon dates prior (or equal) to and following the given date

These programs cannot run unmodified on an HP 42s because they use the Free42 extensions
LSTO, LASTO (local variables); RTNERR (flag error) and DDAYS (days between two dates).
For a quick and dirty port, LSTO, LASTO and RTNERR can be replaced with STO, ASTO and RTN
respectively but DDAYS will need to be implemented afresh.
