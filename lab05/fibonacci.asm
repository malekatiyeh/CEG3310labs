
.ORIG x3000

MAIN
    LD R6, STACK_TOP

    LEA R0, PROMPT
    PUTS

    GETC
    OUT

    LD R1, NEG48
    ADD R0, R0, R1
    ST R0, INPUT_NUM

    ADD R6, R6, #-1
    STR R0, R6, #0

    JSR FIBONACCI

    LDR R4, R6, #0
    ADD R6, R6, #2

    LEA R0, RESULT_MSG
    PUTS

    LD R0, INPUT_NUM
    LD R1, ASCII0
    ADD R0, R0, R1
    OUT

    LEA R0, EQUAL_MSG
    PUTS

    ADD R2, R4, #0
    AND R3, R3, #0

TENS_LOOP
    ADD R1, R2, #-10
    BRn PRINT_NUMBER
    ADD R2, R2, #-10
    ADD R3, R3, #1
    BRnzp TENS_LOOP

PRINT_NUMBER
    ADD R3, R3, #0
    BRz PRINT_ONES

    LD R1, ASCII0
    ADD R0, R3, R1
    OUT

PRINT_ONES
    LD R1, ASCII0
    ADD R0, R2, R1
    OUT

    HALT

FIBONACCI
    ADD R6, R6, #-1

    ADD R6, R6, #-1
    STR R7, R6, #0

    ADD R6, R6, #-1
    STR R5, R6, #0

    ADD R5, R6, #0

    ADD R6, R6, #-1

    LDR R0, R5, #3

    ADD R1, R0, #-1
    BRp RECURSIVE

    STR R0, R5, #2
    BRnzp FIBDONE

RECURSIVE
    ADD R0, R0, #-1
    ADD R6, R6, #-1
    STR R0, R6, #0

    JSR FIBONACCI

    LDR R1, R6, #0
    ADD R6, R6, #2

    STR R1, R5, #-1

    LDR R0, R5, #3
    ADD R0, R0, #-2

    ADD R6, R6, #-1
    STR R0, R6, #0

    JSR FIBONACCI

    LDR R2, R6, #0
    ADD R6, R6, #2

    LDR R1, R5, #-1
    ADD R0, R1, R2

    STR R0, R5, #2

FIBDONE
    ADD R6, R5, #0

    LDR R5, R6, #0
    ADD R6, R6, #1

    LDR R7, R6, #0
    ADD R6, R6, #1

    RET

PROMPT      .STRINGZ "Please enter a number n: "
RESULT_MSG  .STRINGZ "\nF("
EQUAL_MSG   .STRINGZ ") = "

ASCII0  .FILL x0030
NEG48   .FILL xFFD0
INPUT_NUM     .BLKW 1
STACK_TOP   .FILL xF000

.END
