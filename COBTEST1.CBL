     ******************************************************
      *VALIDEAZA O DATA
      *SPECIFICATII
      *DATA SE PRIMESTE IN FORMAT YYYYMMDD
      *DATA SE ACCEPTA DE LA SYSIN
      *SE VA STABILI UN FLAG PT VALID SAU INVALID -- DISPLAY DATA IS
      *VALID/DATA IS NOT VALID
      *RANGE ANI 2010-2025
      *****************************************************

       IDENTIFICATION DIVISION.
       PROGRAM-ID COBTST01
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SPECIAL-NAMES.
           CONSOLE IS CNSL.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-DATA.
           05 WS-YEAR                 PIC 9(4).
              88 VALID-YEAR    VALUES 2010 THRU 2025.
              88 BISECT        VALUES 2012, 2016, 2020, 2024.

           05 WS-MONTH                 PIC 9(2).
              88 VALID-MONTH          VALUES 1 THRU 12.
              88 FEBRUARY             VALUE 02.
              88 MONTH-31          VALUES 01,03,05,07,08,10,12.
              88 MONTH-30              VALUES 04,06,09,11.

           05 WS-DAY                   PIC 9(2).
              88 VALID-DAY31          VALUES 1 THRU 31.
              88 VALID-DAY30          VALUES 1 THRU 30.
              88 VALID-DAY29          VALUES 1 THRU 29.
              88 VALID-DAY28          VALUES 1 THRU 28.

       01 WS-OUT-FILE.
          10 WS-OUT-YEAR              PIC 9(4) VALUE ZEROS.
          10 WS-OUT-MONTH             PIC 9(2) VALUE ZEROS.
          10 WS-OUT-DAY               PIC 9(2) VALUE ZEROS.

       01 WS-REJ-REASON               PIC X(15).
          88 INVALID-YEAR          VALUE 'INCORRECT YEAR '.
          88 INVALID-MONTH         VALUE 'INCORRECT MONTH'.
          88 INVALID-DAY           VALUE 'INCORRECT DAY'.

       01 SW-VALID-DATE            PIC X(3).
          88 VALID                  VALUE 'YES'.
          88 NON-VALID              VALUE 'NO'.

       LINKAGE SECTION .
       01 LS-DATE.
          05 LS-DATE-FOR-PROCES      PIC 9(8).
          05 LS-RESPONSE             PIC X(3).

       PROCEDURE DIVISION USING LS-DATE.

             MOVE LS-DATE-FOR-PROCES TO WS-DATA.

             PERFORM 0900-PROCES-FILE THRU 0909-EXIT.
             MOVE SW-VALID-DATE TO LS-RESPONSE.

             GOBACK.
      **************************************************************
      *REJECT-RECORDS
      **************************************************************

       0900-PROCES-FILE.

           SET VALID-YEAR TO TRUE.
           SET VALID TO TRUE.
           EVALUATE TRUE

           WHEN VALID-MONTH AND VALID-DAY31
               IF MONTH-30 AND NOT VALID-DAY30
                   SET NON-VALID TO TRUE
                   IF MONTH-31 AND NOT VALID-DAY31
                       SET NON-VALID TO TRUE
                   END-IF
               END-IF
               IF BISECT
                   IF FEBRUARY AND NOT VALID-DAY29
                       SET NON-VALID TO TRUE
                   END-IF
               ELSE
                   IF FEBRUARY AND NOT VALID-DAY28
                       SET NON-VALID TO TRUE
                   END-IF
               END-IF
           WHEN OTHER
               SET NON-VALID TO TRUE
           END-EVALUATE.

       0909-EXIT.

