!NO CODE
!RPL

* Return Julian day given date
::
    CK1NOLASTWD
    CK&DISPATCH1
    BINT1 :: (real)
        (get year, month, day on stack)
        %ABS DUP %IP
        SWAP %FP %100 %*
        DUP %IP
        SWAP %FP %10000 %*
        3UNROLL
        BINT42 TestSysFlag
        IT SWAP
        { LAM y LAM m LAM d }
        BIND
        LAM y LAM m %100 %/ %+ LAM d %10000 %/ %+       (date as yyyy.mmdd)
        LAM m %2 %<=
        IT ::  (adjustment for year and month if before March)
               LAM y %1- ' LAM y STO
               LAM m %12 %+ ' LAM m STO
           ;
        %1582.1015 %>=               (adjust year if after Gregorian calendar)
        ITE ::
                LAM y %100 %/ %IP DUP %4 %/ %IP SWAP %- %2 %+
            ;
            %0                       (constant B)
        %365.25 LAM y %*
        LAM y %0 %<
        IT :: %.75 %- ;
        %IP                          (constant C)
        %30.6001 LAM m %1+ %* %IP    (constant D)
        %+ %+ LAM d %+ %1720994.5 %+ (JD=B+C+D+d+1720994.5)

        ABND
    ;
;

@
