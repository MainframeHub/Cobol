        IDENTIFICATION DIVISION.
        PROGRAM-ID. PAYROLL.

        ENVIRONMENT DIVISION.
        INPUT-OUTPUT SECTION.
        FILE-CONTROL.
            SELECT INFILE ASSIGN TO "empdata.txt"
                ORGANIZATION IS LINE SEQUENTIAL.
            SELECT OUTFILE ASSIGN TO "emprep.txt"
                ORGANIZATION IS LINE SEQUENTIAL.
        
        DATA DIVISION.
        FILE SECTION.
        FD INFILE.
        01 INREC.
            05 EMP-ID   PIC 9(5).
            05 FILLER   PIC X(1).
            05 NAME     PIC X(20).
            05 HOURS    PIC 9(3).
            05 RATE     PIC 9(3)V99.

        FD OUTFILE.
        01 OUTREC       PIC X(80).

        WORKING-STORAGE SECTION.
        01 EOF      PIC X VALUE "N".
        01 GROSS    PIC 9(7)v99 VALUE 0.
        01 TOTAL    PIC 9(7)V99 VALUE 0.
        01 WS-LINE     PIC X(80).

        PROCEDURE DIVISION.
        MAIN-LOGIC.
            OPEN INPUT INFILE
                 OUTPUT OUTFILE

            PERFORM UNTIL EOF = "Y"
                READ INFILE
                    AT END MOVE "Y" TO EOF
                    NOT AT END PERFORM PARA1
                END-READ
            END-PERFORM

            CLOSE INFILE OUTFILE.

            DISPLAY "PROCESSING COMPLETE".
            DISPLAY "TOTAL PAY FOR ALL EMPLOYEES : " TOTAL

            STOP RUN.

            PARA1.
                COMPUTE GROSS = HOURS * RATE
                COMPUTE TOTAL = TOTAL + GROSS

                STRING
                    "   ID: " EMP-ID
                    "   NAME: " NAME
                    "  HOURS: " HOURS
                    "  RATE: " RATE
                    "  PAY: " GROSS
                        DELIMITED BY SIZE
                    INTO WS-LINE
                END-STRING

                WRITE OUTREC FROM WS-LINE.




