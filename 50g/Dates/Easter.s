!NO CODE
!RPL

(Jan Meeus' algorithm to determine date of Easter given the year)
::
    CK1NOLASTWD
    CK&DISPATCH1
    BINT1 ::
        (only valid for Gregorian calendar)
        DUP %1583 %<=
        IT ::
            SETSIZEERR
            ERRJMP
        ;
        DUP DUP
        %19 %MOD                                (y mod 19: a)
        SWAP
        %100 %/ DUP %FP %100 %* SWAP %IP        (y/100: c[rem], b[quot])
        DUP
        %4 %/ DUP %FP %4 %* SWAP %IP            (b/4: e[rem], d[quot])
        ROT DUP DUP
        %8 %+ %25 %/ %IP                        (IP[[b+8]/25]: f)
        %- %1 %+ %3 %/ %IP                      (IP[[b-f+1]/3]: g)
        %- SWAP %- %15 %+ 4PICK
        %19 %* %+ %30 %MOD                      (19a+b-d-g+15 mod 30: h)
        ROT
        %4 %/ DUP %FP %4 %* SWAP %IP            (c/4: k[rem], i[quot])
        4ROLL
        %2 %* SWAP %2 %* %+ SWAP %-
        %32 %+ OVER %- %7 %MOD                  (32+2e+2i-h-k mod 7: l)
        ROT OVER
        %22 %* %+ 3PICK %11 %* %+
        %451 %/ %IP                             (IP[[a+11h+22l]/451]: m)
        %7 %* %- %+ %114 %+ %31 %/              ([h+l-7m+114]/31: p[rem], n[quot])
        DUP %FP %31 %* %1 RNDXY %1 %+ SWAP %IP  (mm=n, dd=p+1)
        BINT42 TestSysFlag NOT IT SWAP
        %100 %/ %+ SWAP %1000000 %/ %+          (dd.mmyyyy or mm.ddyyyy)
    ;
;

@
