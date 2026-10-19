.ORIG x3000

MAIN
    LD R6, STACK_START

    ADD R5, R6, #0

    ADD R6, R6, #-5

    AND R0, R0, #0
    ADD R0, R0, #2
    STR R0, R6, #0

    ADD R0, R0, #1
    STR R0, R6, #1

    ADD R0, R0, #2
    STR R0, R6, #2

    AND R0, R0, #0
    STR R0, R6, #3

    ADD R0, R0, #1
    STR R0, R6, #4

    ADD R4, R6, #0

    LD R0, ARRAY_SIZE
    ADD R6, R6, #-1
    STR R0, R6, #0

    ADD R6, R6, #-1
    STR R4, R6, #0

    JSR SUMOFSQUARES

    LDR R0, R6, #0

    ADD R6, R6, #3

    ADD R6, R6, #-1
    STR R0, R6, #0

    HALT

ARRAY_SIZE  .FILL #5
STACK_START .FILL xF000

SQUARE
    ADD R6, R6, #-1

    ADD R6, R6, #-1
    STR R7, R6, #0

    ADD R6, R6, #-1
    STR R5, R6, #0

    ADD R5, R6, #0

    ADD R6, R6, #-1
    AND R0, R0, #0
    STR R0, R5, #-1

    LDR R1, R5, #3

    AND R0, R0, #0

    ADD R2, R1, #0

    BRnz SQUARE_DONE

SQUARE_LOOP
    ADD R0, R0, R1

    ADD R2, R2, #-1

    BRp SQUARE_LOOP

SQUARE_DONE
    STR R0, R5, #-1

    STR R0, R5, #2

    ADD R6, R5, #0

    LDR R5, R6, #0
    ADD R6, R6, #1

    LDR R7, R6, #0
    ADD R6, R6, #1

    RET


SUMOFSQUARES
    ADD R6, R6, #-1

    ADD R6, R6, #-1
    STR R7, R6, #0

    ADD R6, R6, #-1
    STR R5, R6, #0

    ADD R5, R6, #0

    ADD R6, R6, #-1
    AND R0, R0, #0
    STR R0, R5, #-1

    ADD R6, R6, #-1
    STR R0, R5, #-2

SUM_LOOP
    LDR R0, R5, #-1
    LDR R1, R5, #4

    NOT R1, R1
    ADD R1, R1, #1
    ADD R2, R0, R1

    BRzp SUM_DONE

    LDR R1, R5, #3

    ADD R1, R1, R0

    LDR R2, R1, #0

    ADD R6, R6, #-1
    STR R2, R6, #0

    JSR SQUARE

    LDR R0, R6, #0

    ADD R6, R6, #2

    LDR R1, R5, #-2
    ADD R1, R1, R0
    STR R1, R5, #-2

    LDR R0, R5, #-1
    ADD R0, R0, #1
    STR R0, R5, #-1

    BRnzp SUM_LOOP

SUM_DONE
    LDR R0, R5, #-2
    STR R0, R5, #2

    ADD R6, R5, #0

    LDR R5, R6, #0
    ADD R6, R6, #1

    LDR R7, R6, #0
    ADD R6, R6, #1

    RET


.END