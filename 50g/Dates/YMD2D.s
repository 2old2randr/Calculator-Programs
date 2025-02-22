!NO CODE
!RPL

* Return HP date given year, month day on stack
::
    CK3NOLASTWD
    CK&DISPATCH1
    BINT7 :: (3 reals)
        %IP                 (Use only integer part of the day number)
        BINT42 TestSysFlag  (Swap m & d if American format)
        IT SWAP
        %100 %/ %+ SWAP
        DUP %SIGN SWAP %ABS (Use absolute value of year)
        %1000000 %/ ROT %+
        %*                  (restore sign)
    ;
;

@
