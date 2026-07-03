        IDENTIFICATION DIVISION.
        PROGRAM-ID. PAYROLL2.

        ENVIRONMENT DIVISION.
        INPUT-OUTPUT SECTION.
        FILE-CONTROL.
            SELECT INFILE ASSIGN TO "empdata.txt"
                ORGANIZATION IS LINE SEQUENTIAL.
            SELECT OUTFILE ASSIGN TO "outdata.txt"
                ORGANIZATION IS LINE SEQUENTIAL.

        DATA DIVISION.
        FILE SECTION.
        FD INFILE.
        01 EMP-REC.
           05 EMP-ID        PIC 9(5).
           05 EMP-NAME      PIC X(20).
           05 EMP-HOURS     PIC 9(3).
           05 EMP-RATE      PIC 9(3)V99.

        FD OUTFILE.
        01 OUT-REC          PIC X(80).

        WORKING-STORAGE SECTION.
        01 EOF      PIC X(1) VALUE "N".
        01 GROSS    PIC 9(5)V99 VALUE 0.
        01 TOTAL    PIC 9(7)V99 VALUE 0.
        01  


