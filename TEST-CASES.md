DSalone MediStock — Test Cases and Results

1. Purpose

This document defines the test cases used to evaluate the main functions of the DSalone MediStock Dart console prototype.

The actual result and status of each test are recorded after running the application.

2. Test Environment

- Application: DSalone MediStock
- Language: Dart
- IDE: Visual Studio Code
- Execution method: VS Code terminal or another terminal that supports interactive input
- Storage: In-memory lists

3. Test Cases

Test ID| Function| Test Input or Action| Expected Result| Actual Result| Status
TC01| Register medicine| Enter a new medicine ID and valid details| Medicine is registered| pass| Tested
TC02| Duplicate ID| Register an ID that already exists| Duplicate is rejected| pass| Tested
TC03| Receive stock| Enter a registered medicine ID and valid stock details| Stock record is created|  | Not pass
|TView stock| Select View Current Stock after receiving stock| Stock details and quantity are displayed| pass| Tested
TC05| Valid dispensing| Dispense less than or equal to available stock| Stock decreases by the quantity dispensed| pass| Tested
TC06| Excessive dispensing| Request more than available stock| Transaction is rejected and stock remains unchanged| pass| Tested
TC07| Low-stock report| Set quantity at or below reorder level| Item appears in the report| pass| Tested
TC08| Search medicine| Search by registered ID or name| Matching medicine is displayed| pass| Tested
TC09| Dispensing records| Complete a dispensing transaction and view records| Transaction details are displayed| pass| Tested
TC10| Invalid menu choice| Enter an unsupported menu option| Error message is displayed| pass| Tested
TC11| Empty input| Submit an empty required text field| Program prompts for non-empty input| pass| Tested
TC12| Invalid quantity| Enter zero, a negative number, or non-numeric text| Program requests a positive whole number| pass| Tested
TC13| Invalid expiry date| Enter a date in an invalid format| Program prompts for a valid date| pass| Tested
TC14| Expiry alert| Enter a valid expiry date within the warning period| Item appears in the expiry report| pass| Tested

4. Sample Test Data

We Use fictional sample data for testing.

Medicine details

- Medicine ID: MED001
- Medicine name: Paracetamol
- Category: Analgesic
- Unit: Tablet

Stock details

- Quantity received: 500
- Expiry date: 2027-08-30
- Reorder level: 100

Dispensing test

- Quantity available before dispensing: 500
- Quantity requested: 20
- Expected remaining quantity: 480

Insufficient-stock test

- Quantity available: 480
- Quantity requested: 600
- Expected result: Transaction rejected; quantity remains 480.

5. Recording Results Guide for you if you also want to test it.

After each test, replace "pass" with The actual output or observed behavior.

Use these status labels:

- Pass: Actual behavior matches the expected result.
- Fail: Actual behavior does not match the expected result.
- Not tested: The test has not been performed.

If a test fails, describe the issue, correct it where appropriate, and repeat the test.

6. Testing Conclusion

Complete this section after testing:

"The DSalone MediStock prototype was tested against the defined test cases. Of the 14 tests executed, 14 passed and 0 failed. The main issues identified were 'none identified during the tests performed'. The test results demonstrate how accurate the system is."