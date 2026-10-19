import 'dart:io';

class Medicine {
  String id;
  String name;
  String category;
  String unit;

  Medicine(this.id, this.name, this.category, this.unit);
}

class StockItem {
  Medicine medicine;
  int quantity;
  DateTime expiryDate;
  int reorderLevel;

  StockItem(
    this.medicine,
    this.quantity,
    this.expiryDate,
    this.reorderLevel,
  );

  bool isLowStock() {
    return quantity <= reorderLevel;
  }

  bool isExpiringSoon() {
    DateTime today = DateTime.now();
    DateTime warningDate = today.add(const Duration(days: 90));

    return expiryDate.isBefore(warningDate) &&
        expiryDate.isAfter(today);
  }
}

class DispensingRecord {
  String recordId;
  Medicine medicine;
  int quantity;
  String recipient;
  DateTime date;

  DispensingRecord(
    this.recordId,
    this.medicine,
    this.quantity,
    this.recipient,
    this.date,
  );
}

class MediStockSystem {
  List<Medicine> medicines = [];
  List<StockItem> stockItems = [];
  List<DispensingRecord> dispensingRecords = [];

  void registerMedicine() {
    print('\n--- REGISTER MEDICINE ---');

    String id = readText('Enter medicine ID: ');

    if (findMedicine(id) != null) {
      print('Medicine with this ID already exists.');
      return;
    }

    String name = readText('Enter medicine name: ');
    String category = readText('Enter category: ');
    String unit = readText('Enter unit: ');

    Medicine medicine = Medicine(id, name, category, unit);
    medicines.add(medicine);

    print('\nMedicine registered successfully.');
  }

  void receiveStock() {
    print('\n--- RECEIVE STOCK ---');

    String id = readText('Enter medicine ID: ');
    Medicine? medicine = findMedicine(id);

    if (medicine == null) {
      print('Medicine not found.');
      return;
    }

    int quantity = readPositiveInt('Enter quantity received: ');
    DateTime? expiryDate = readDate('Enter expiry date (YYYY-MM-DD): ');

    if (expiryDate == null) {
      print('Invalid date.');
      return;
    }

    int reorderLevel =
        readPositiveInt('Enter reorder level: ');

    StockItem? existingStock = findStock(id);

    if (existingStock != null) {
      existingStock.quantity += quantity;
      existingStock.expiryDate = expiryDate;
      existingStock.reorderLevel = reorderLevel;

      print('\nStock updated successfully.');
      print('New quantity: ${existingStock.quantity}');
    } else {
      StockItem stockItem = StockItem(
        medicine,
        quantity,
        expiryDate,
        reorderLevel,
      );

      stockItems.add(stockItem);

      print('\nStock received successfully.');
      print('Current quantity: $quantity');
    }
  }

  void viewStock() {
    print('\n--- CURRENT STOCK ---');

    if (stockItems.isEmpty) {
      print('No stock records available.');
      return;
    }

    print(
      'ID\tMedicine\t\tQuantity\tExpiry\t\tStatus',
    );
    print('-' * 75);

    for (StockItem item in stockItems) {
      String status = item.isLowStock() ? 'LOW STOCK' : 'OK';

      print(
        '${item.medicine.id}\t'
        '${item.medicine.name.padRight(16)}'
        '${item.quantity.toString().padRight(8)}\t'
        '${formatDate(item.expiryDate)}\t'
        '$status',
      );
    }
  }

  void dispenseMedicine() {
    print('\n--- DISPENSE MEDICINE ---');

    String id = readText('Enter medicine ID: ');
    StockItem? stock = findStock(id);

    if (stock == null) {
      print('Medicine stock record not found.');
      return;
    }

    int quantity = readPositiveInt(
      'Enter quantity to dispense: ',
    );

    if (quantity > stock.quantity) {
      print('\nTransaction rejected.');
      print('Available stock: ${stock.quantity}');
      print('Requested quantity: $quantity');
      print('Reason: Insufficient stock.');
      return;
    }

    String recipient = readText('Enter recipient name/ID: ');

    stock.quantity -= quantity;

    String recordId =
        'DSP${(dispensingRecords.length + 1).toString().padLeft(3, '0')}';

    DispensingRecord record = DispensingRecord(
      recordId,
      stock.medicine,
      quantity,
      recipient,
      DateTime.now(),
    );

    dispensingRecords.add(record);

    print('\nMedicine dispensed successfully.');
    print('Medicine: ${stock.medicine.name}');
    print('Quantity dispensed: $quantity');
    print('Remaining stock: ${stock.quantity}');

    if (stock.isLowStock()) {
      print('Warning: This medicine is now LOW STOCK.');
    }
  }

  void checkLowStock() {
    print('\n--- LOW STOCK REPORT ---');

    List<StockItem> lowStockItems =
        stockItems.where((item) => item.isLowStock()).toList();

    if (lowStockItems.isEmpty) {
      print('No low-stock medicines found.');
      return;
    }

    for (StockItem item in lowStockItems) {
      print(
        '${item.medicine.name} - '
        'Current: ${item.quantity}, '
        'Reorder level: ${item.reorderLevel}',
      );
    }
  }

  void checkExpiry() {
    print('\n--- EXPIRY ALERT ---');

    List<StockItem> expiringItems =
        stockItems.where((item) => item.isExpiringSoon()).toList();

    if (expiringItems.isEmpty) {
      print('No medicines are approaching expiry.');
      return;
    }

    for (StockItem item in expiringItems) {
      print(
        '${item.medicine.name} - '
        'Expiry date: ${formatDate(item.expiryDate)}',
      );
    }
  }

  void searchMedicine() {
    print('\n--- SEARCH MEDICINE ---');

    String keyword =
        readText('Enter medicine ID or name: ').toLowerCase();

    bool found = false;

    for (Medicine medicine in medicines) {
      if (medicine.id.toLowerCase() == keyword ||
          medicine.name.toLowerCase().contains(keyword)) {
        print('\nMedicine found:');
        print('ID: ${medicine.id}');
        print('Name: ${medicine.name}');
        print('Category: ${medicine.category}');
        print('Unit: ${medicine.unit}');

        StockItem? stock = findStock(medicine.id);

        if (stock != null) {
          print('Available quantity: ${stock.quantity}');
          print('Expiry date: ${formatDate(stock.expiryDate)}');
        }

        found = true;
      }
    }

    if (!found) {
      print('No medicine found.');
    }
  }

  void viewDispensingRecords() {
    print('\n--- DISPENSING RECORDS ---');

    if (dispensingRecords.isEmpty) {
      print('No dispensing records available.');
      return;
    }

    for (DispensingRecord record in dispensingRecords) {
      print('\nRecord ID: ${record.recordId}');
      print('Medicine: ${record.medicine.name}');
      print('Quantity: ${record.quantity}');
      print('Recipient: ${record.recipient}');
      print('Date: ${formatDate(record.date)}');
    }
  }

  Medicine? findMedicine(String id) {
    for (Medicine medicine in medicines) {
      if (medicine.id.toLowerCase() == id.toLowerCase()) {
        return medicine;
      }
    }

    return null;
  }

  StockItem? findStock(String medicineId) {
    for (StockItem item in stockItems) {
      if (item.medicine.id.toLowerCase() ==
          medicineId.toLowerCase()) {
        return item;
      }
    }

    return null;
  }

  void start() {
    while (true) {
      print('\n==========================================');
      print('          DSALONE MEDISTOCK');
      print(' Health Facility Medicine Stock Tracker');
      print('==========================================');
      print('1. Register Medicine');
      print('2. Receive Stock');
      print('3. View Current Stock');
      print('4. Dispense Medicine');
      print('5. Low Stock Report');
      print('6. Expiry Alert');
      print('7. Search Medicine');
      print('8. Dispensing Records');
      print('9. Exit');
      print('==========================================');

      String choice = readText('Enter your choice: ');

      switch (choice) {
        case '1':
          registerMedicine();
          break;

        case '2':
          receiveStock();
          break;

        case '3':
          viewStock();
          break;

        case '4':
          dispenseMedicine();
          break;

        case '5':
          checkLowStock();
          break;

        case '6':
          checkExpiry();
          break;

        case '7':
          searchMedicine();
          break;

        case '8':
          viewDispensingRecords();
          break;

        case '9':
          print('\nThank you for using DSalone MediStock.');
          print('Program closed.');
          return;

        default:
          print('\nInvalid choice. Please select 1-9.');
      }
    }
  }
}

String readText(String message) {
  while (true) {
    stdout.write(message);
    String? input = stdin.readLineSync();

    if (input != null && input.trim().isNotEmpty) {
      return input.trim();
    }

    print('Input cannot be empty.');
  }
}

int readPositiveInt(String message) {
  while (true) {
    stdout.write(message);
    String? input = stdin.readLineSync();

    int? value = int.tryParse(input ?? '');

    if (value != null && value > 0) {
      return value;
    }

    print('Please enter a positive whole number.');
  }
}

DateTime? readDate(String message) {
  while (true) {
    stdout.write(message);
    String? input = stdin.readLineSync();

    try {
      return DateTime.parse(input ?? '');
    } catch (e) {
      print('Invalid date. Example: 2027-08-30');
    }
  }
}

String formatDate(DateTime date) {
  return '${date.year}-'
      '${date.month.toString().padLeft(2, '0')}-'
      '${date.day.toString().padLeft(2, '0')}';
}

void main() {
  MediStockSystem system = MediStockSystem();

  system.start();
}