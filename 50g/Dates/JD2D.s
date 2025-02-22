!NO CODE
!RPL

* Convert a Julian date to a date (yy, mm, dd on stack)
::
    CK1NOLASTWD
    CK&DISPATCH1
    BINT1 :: (real)
        %.5 %+ DUP %FP SWAP %IP       (I=integer part, F=fractional part)
        DUP %2299160. %>
        IT ::
            DUP %1867216.25 %-        (A=IP[[I-1867216.25]/36524.25])
            %36524.25 %/ %IP
            DUP %4 %/ %IP %- %1+ %+   (B=I+I+A-IP[A/4])
        ;                             (else B=I)
        %1524 %+                      (C=B+1524)
        DUP %122.1 %- %365.25 %/ %IP  (D=IP[[C-122.1]/365.25])
        DUP %365.25 %* %IP            (E=IP[356.25*D])
        3PICK OVER %- %30.6001 %/ %IP (G=IP[[C-E]/30.6001])
        4ROLL ROT %-                  (Day no.=C-E+F-IP[G*30.6001])
        4ROLL %+ %30.6001 3PICK %* %IP %- SWAP
        DUP %13.5 %<
        ITE %1 %13 %-                 (m= G-1 or G-13)
        ROT
        OVER %2.5 %>
        ITE %4716 %4715 %-            (If m>2.5, y=D-4716)
        (day, month, year on stack - combine)
        UNROT
        BINT42 TestSysFlag NOT IT SWAP
        %100 %/ %+ SWAP %1000000 %/ %+
    ;
;

@
