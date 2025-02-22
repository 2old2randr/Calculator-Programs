!RPL

::
  CK0NOLASTWD
  (Get voltage - code from Edwin Cordoba)
  CODE
    SAVE
    INTOFF
    SKUB {
      *start
!ARM
      STMDB sp! { R4 R5 R6 R7 R8 LP }
      MOV R2 $7C00000
      ADD R2,R2 $0C
      LDR R2,[R2]
      STR R2,[R1 #2316]
      LDMIA sp! { R4 R5 R6 R7 R8 PC }
!ASM
      *end
    }
    C=RSTK D0=C
    D1=80100
    LC(5) end-start MOVEDN
    LC 80100 ARMSAT
    INTON
    LC 003FF
    A&C.A
    GOSBVL PUSH#ALOOP
  ENDCODE
  UNCOERCE
  (max value returned is #3D1h corresponding to 5.99V)
  (Integer is mapped to voltage using an exponential fit)
  %.979830943213
  %^
  %.00703903790496
  %*
  (rounded to two decimals for display)
  %2
  RNDXY
  DUP
  DO>STR "V (" &$
  SWAP
  ::
    %4.8 %> case :: "Good)" &$ ;
    %4.2 %> case :: "Charge)" &$ ;
    "Bad)" &$
  ;
  ClrDA1IsStat
  RECLAIMDISP
  DISPROW1
  SetDA1Temp
;

@
