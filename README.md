DSalone MediStock

Health Facility Medicine Stock and Dispensing Tracker

A Dart Console-Based Object-Oriented Programming Project

Case-Study Organization

- Organization: Al-Huda Islamic Health Center
- Location: Waterloo, Sierra Leone
- Current record-keeping method: Notebooks
- Programming language: Dart
- Application type: Console-based prototype

1. Project Overview

DSalone MediStock is an academic software prototype designed to demonstrate how a computerized application can support medicine inventory management at Al-Huda Islamic Health Center in Waterloo, Sierra Leone.

The project focuses on the challenges associated with notebook-based medicine records and proposes a structured way to record medicine details, stock received, dispensing transactions, available quantities, and expiry information.

The application is developed in Dart using object-oriented programming principles.

2. Problem Being Addressed

According to the information provided for this case study, the health center maintains medicine records using notebooks. Manual record keeping can make it more difficult to review stock quantities, locate records, identify items that need replenishment, and monitor expiry dates efficiently.

DSalone MediStock demonstrates a computerized approach to these activities.

3. Objectives

- Organize medicine registration.
- Record received medicine stock.
- Display current stock quantities.
- Process medicine dispensing.
- Reject dispensing requests exceeding available stock.
- Identify low-stock items.
- Check approaching expiry dates.
- Search for medicine information.
- Display dispensing transactions.

4. Features

Feature| Description
Medicine registration| Records medicine ID, name, category, and unit.
Stock receiving| Records quantity received, expiry date, and reorder level.
Stock viewing| Displays available stock records.
Dispensing| Deducts a valid dispensing quantity.
Stock validation| Rejects dispensing beyond available stock.
Low-stock report| Lists items at or below reorder level.
Expiry alert| Lists stock approaching expiry under the implemented 90-day rule.
Medicine search| Searches by medicine ID or name.
Dispensing records| Displays transactions recorded during the current session.

5. Technologies

- Dart SDK
- Visual Studio Code
- Git
- GitHub

6. Object-Oriented Design

The system contains four main classes:

- "Medicine" — stores medicine details.
- "StockItem" — stores quantity, expiry date, and reorder level.
- "DispensingRecord" — represents a dispensing transaction.
- "MediStockSystem" — coordinates the application's main functions.

7. Installation and Execution

Prerequisites

Install the Dart SDK and Visual Studio Code.

Check that Dart is available:

dart --version

Clone the Repository

git clone https://github.com/alhajifodaykoroma/DSalone-MediStock.git

Open the Project

cd DSalone-MediStock

Run the Application

dart run main.dart

8. Menu Options

1. Register Medicine
2. Receive Stock
3. View Current Stock
4. Dispense Medicine
5. Low Stock Report
6. Expiry Alert
7. Search Medicine
8. Dispensing Records
9. Exit

9. Example Test Workflow

1. Register a medicine using a unique ID.
2. Receive stock using the same ID.
3. Enter the received quantity, expiry date, and reorder level.
4. View current stock.
5. Dispense a quantity that is less than the available stock.
6. Confirm that the remaining quantity is correct.
7. Try dispensing more than the remaining quantity.
8. Confirm that the transaction is rejected.

10. Testing

The project should be tested using valid and invalid inputs. Actual results should be recorded in "docs/TEST-CASES.md".

11. Storage Limitation

The current version uses in-memory lists. Records are not saved permanently and will be lost when the program terminates.

The application does not currently use a database or JSON storage.

12. Future Improvements

- Persistent file or database storage.
- PostgreSQL or Supabase integration.
- Batch-level stock and expiry tracking.
- User authentication and role-based access.
- Multi-facility inventory management.
- Stock movement and audit history.
- More detailed reports.
- A graphical or Flutter mobile interface.

13. Academic Purpose

This project demonstrates requirements analysis, object-oriented design, Dart programming, input validation, basic inventory processing, testing, documentation, and GitHub version control.

14. Author and Academic Details

- Students: Alhaji Foday Koroma, Robert Isacc Kamara, Sahid Mohamed Dumbuya, George NGoloMusa Turay, Alice Isatu Bangura
- Student IDs: 905006433, 
- Programme: BSc Software Engineering with Multimedia
- Institution: Limkokwing University of Creative Technology, Sierra Leone
- Module: Software Engineering

15. Disclaimer

DSalone MediStock is an educational prototype proposed for the Al-Huda Islamic Health Center case study. It has not been represented as an officially deployed or approved system. It is not intended to replace a validated healthcare inventory system.