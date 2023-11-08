       IDENTIFICATION DIVISION.
       PROGRAM-ID. COBVDATE.
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SPECIAL-NAMES.
           CONSOLE IS CNSL.
       DATA DIVISION.

       WORKING-STORAGE SECTION.

       01 WS-DATE.
           05 WS-YY         PIC 9(2) VALUE ZERO.
           05 WS-MM         PIC 9(2) VALUE ZERO.
           05 WS-DD         PIC 9(2) VALUE ZERO.

       01 WS-DATE-FOR-LINKAGE.
           05 WS-MC        PIC 9(2) VALUE 20.
           05 WS-YYMMDD    PIC 9(6).
           05 WS-RESPONSE  PIC X(3).
               88 VALID    VALUE 'YES'.
               88 NON-VALID  VALUE 'NO'.

       PROCEDURE DIVISION.
           ACCEPT WS-DATE FROM DATE.
           MOVE WS-DATE TO WS-YYMMDD.

           CALL 'COBTEST1' USING WS-DATE-FOR-LINKAGE.

           IF VALID
               DISPLAY 'DATE IS VALID:' WS-DATE-FOR-LINKAGE UPON CNSL
           ELSE
               DISPLAY 'DATE IS INVALID:' WS-DATE-FOR-LINKAGE UPON CNSL
           END-IF.

           STOP RUN.
