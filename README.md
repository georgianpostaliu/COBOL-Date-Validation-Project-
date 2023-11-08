# COBOL-Date-Validation-Project-

This COBOL project aims to validate input dates provided in the format YYYYMMDD. The specifications state that the input date must be accepted from the SYSIN, and a flag will be established to indicate whether the input date is valid or invalid. The program checks if the input date falls within the range of years 2010-2025 and validates the month and day accordingly.

Project Structure:
Identification Division:

    Program ID: COBTST01

Environment Division:

    Configuration Section: Configures special names, setting the console as CNSL.

Data Division:

    Working-Storage Section:
        WS-DATA: Contains variables for year, month, and day to store the input date.
        WS-OUT-FILE: Stores the output date components.
        WS-REJ-REASON: Indicates the reason for date rejection.
        SW-VALID-DATE: Flag indicating if the input date is valid or not.

Linkage Section:

    LS-DATE: Contains input date and response variables passed as parameters to the PROCEDURE DIVISION.

Procedure Division:

    Validation Logic (0900-PROCES-FILE):
        Validates the input date components (year, month, and day) based on the provided specifications.
        Checks if the year is within the range 2010-2025 and validates month and day accordingly.
        Handles leap years (bisect years) by ensuring correct validation for February.

    Exit (0909-EXIT):
        Marks the end of the validation process.

How It Works:

    Input Data:
        The input date is received in the LS-DATE-FOR-PROCES variable passed through the linkage section.

    Validation Process:
        The program checks if the input year is between 2010 and 2025 (VALID-YEAR and BISECT flags).
        It validates the month using the VALID-MONTH flag and specific month ranges (MONTH-31 and MONTH-30).
        The program considers leap years (identified by the BISECT flag) and validates February days.
        If any validation fails, the SW-VALID-DATE flag is set to NON-VALID, and the appropriate rejection reason is set in WS-REJ-REASON.

    Output:
        The validation result (SW-VALID-DATE) is moved to LS-RESPONSE to indicate if the date is valid or not.

Notes:

    The program is structured to validate dates within a specific range and handles different month lengths and leap years correctly.
    The rejection reason is specified in WS-REJ-REASON if the input date does not meet the validation criteria.
    The program does not modify the input date; it only validates it and provides a response indicating its validity status.

This COBOL program serves as a validation tool for ensuring that input dates adhere to the specified format and constraints, offering a reliable solution for date validation in COBOL applications.
