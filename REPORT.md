DSalone MediStock — Technical Report

1. Introduction

DSalone MediStock is a Dart console prototype for demonstrating basic medicine stock and dispensing management in a health facility context in Sierra Leone.

2. System Design

The system is organized into four classes: "Medicine", "StockItem", "DispensingRecord", and "MediStockSystem". These classes separate medicine information, stock details, dispensing transactions, and application operations.

3. Core Processing

The user registers a medicine before recording its stock. When stock is received, the system creates or updates the corresponding stock record. When a dispensing request is valid, the system reduces the available quantity and records the transaction. Requests exceeding available stock are rejected.

4. Validation and Reporting

The application validates required text input, positive whole-number quantities, and date input. It provides medicine search, low-stock reporting, and an approaching-expiry check.

5. Storage Limitation

The current implementation stores data in in-memory lists. Records are available during the current execution session but are not preserved after the application terminates.

6. Testing

Testing should cover medicine registration, stock receiving, stock viewing, dispensing, insufficient-stock handling, search, reports, and invalid input. Results must be recorded in "docs/TEST-CASES.md" after execution.

7. Conclusion

The prototype demonstrates the application of Dart classes and basic object-oriented programming to an inventory management problem. Future development can introduce persistent storage, batch-level expiry tracking, authentication, and multi-facility support.s