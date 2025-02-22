!NO CODE
!RPL

* Decompose an HP date to year, month, day on stack
::
    CK1NOLASTWD
    CK&DISPATCH1
    BINT1 :: (real)
        DUP %SIGN SWAP %ABS      (Determine sign, make positive)
        DUP %IP                  (Day or month depending on flag 42)
        SWAP %FP %100 %*
        DUP %IP                  (Month or day)
        SWAP %FP %10000 %*       (year)
        4ROLL %*                 (preserve sign on year)
        3UNROLL                  (YYYY MM/DD MM/DD)
        BINT42 TestSysFlag
        IT SWAP                  (Correct day/month order if needed)
    ;
;

@
