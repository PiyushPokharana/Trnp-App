import 'package:drift/drift.dart';

// --- Part 18: Database Architecture ---

/// Companies Table (Top level partition)
class Companies extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 1, max: 100)();
  TextColumn get businessType => text()(); // 'Transport', 'Trading', 'Other'
  TextColumn get defaultCurrency => text().withDefault(const Constant('INR'))();
  BoolColumn get isActive => boolean().withDefault(const Constant(true))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}

/// Shared People Master (Customer, Supplier, Driver, Buyer, Seller, etc.)
class People extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 1, max: 100)();
  TextColumn get phone => text().nullable()();
  TextColumn get notes => text().nullable()();
  BoolColumn get isActive => boolean().withDefault(const Constant(true))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}

/// Person Roles join table (Supports multi-role per person)
class PersonRoles extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get personId => integer().references(People, #id)();
  TextColumn get role => text()(); // Driver, Customer, Scrap Dealer, Buyer, Seller, etc.
  IntColumn get companyId => integer().nullable().references(Companies, #id)();
}

/// Vehicles Master (Transport trucks & Trading vehicles)
class Vehicles extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get companyId => integer().references(Companies, #id)();
  IntColumn get ownerPersonId => integer().nullable().references(People, #id)();
  TextColumn get regNumber => text()(); // e.g. RJ14-XX-1234
  TextColumn get make => text().nullable()();
  TextColumn get model => text().nullable()();
  TextColumn get vehicleType => text().nullable()();
  TextColumn get chassisNo => text().nullable()();
  TextColumn get engineNo => text().nullable()();
  DateTimeColumn get purchaseDate => dateTime().nullable()();
  RealColumn get purchasePrice => real().withDefault(const Constant(0.0))();
  TextColumn get status => text()(); // Active, Under Repair, Sold, Scrap, Dismantling
  TextColumn get businessContext => text()(); // Transport or Trading
  TextColumn get notes => text().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}

/// Dismantled Vehicle Components (Truck Trading breakdown: Engine, Body, Cabin, Tyres, etc.)
class VehicleComponents extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get vehicleId => integer().references(Vehicles, #id)();
  TextColumn get componentType => text()(); // Engine, Body, Cabin, Tyres, Whole, Other
  TextColumn get status => text().withDefault(const Constant('Unsold'))(); // Unsold, Sold
  IntColumn get saleTransactionId => integer().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}

/// Categories Master (Universal Transaction types: Diesel, Toll, Freight, Part Sale, Labour, etc.)
class TransactionCategories extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 1, max: 80)();
  TextColumn get direction => text()(); // Inflow, Outflow, Transfer
  IntColumn get scopeCompanyId => integer().nullable().references(Companies, #id)(); // null = Global
  BoolColumn get isUserCreated => boolean().withDefault(const Constant(false))();
  TextColumn get iconName => text().nullable()();
}

/// Payment Accounts (Cash, Bank, UPI running balances)
class PaymentAccounts extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()(); // Cash Wallet, SBI Bank Account, PhonePe UPI
  TextColumn get type => text()(); // Cash, Bank, UPI, Other
  RealColumn get openingBalance => real().withDefault(const Constant(0.0))();
  BoolColumn get isActive => boolean().withDefault(const Constant(true))();
}

/// Transport Trips
class Trips extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get companyId => integer().references(Companies, #id)();
  IntColumn get customerPersonId => integer().references(People, #id)();
  IntColumn get vehicleId => integer().references(Vehicles, #id)();
  IntColumn get driverPersonId => integer().nullable().references(People, #id)();
  TextColumn get origin => text().nullable()();
  TextColumn get destination => text().nullable()();
  TextColumn get material => text().nullable()();
  RealColumn get freightAmount => real().withDefault(const Constant(0.0))();
  TextColumn get status => text().withDefault(const Constant('Active'))(); // Draft, Active, Delivered, Closed, Cancelled
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}

/// Truck Deals (Trading / Scrapping)
class TruckDeals extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get companyId => integer().references(Companies, #id)();
  IntColumn get vehicleId => integer().references(Vehicles, #id)();
  IntColumn get sellerPersonId => integer().nullable().references(People, #id)();
  TextColumn get dealType => text()(); // Scrap, Resale
  RealColumn get purchaseAmount => real().withDefault(const Constant(0.0))();
  DateTimeColumn get purchaseDate => dateTime()();
  TextColumn get status => text().withDefault(const Constant('Purchased'))(); // Purchased, InProgress, PartiallySold, FullySold
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}

/// Universal Transaction Engine (The heart of the entire system)
class Transactions extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get companyId => integer().references(Companies, #id)();
  IntColumn get categoryId => integer().references(TransactionCategories, #id)();
  IntColumn get personId => integer().nullable().references(People, #id)();
  IntColumn get vehicleId => integer().nullable().references(Vehicles, #id)();
  IntColumn get tripId => integer().nullable().references(Trips, #id)();
  IntColumn get dealId => integer().nullable().references(TruckDeals, #id)();
  IntColumn get accountId => integer().nullable().references(PaymentAccounts, #id)();
  IntColumn get componentId => integer().nullable().references(VehicleComponents, #id)();
  
  DateTimeColumn get date => dateTime()();
  RealColumn get amount => real()();
  TextColumn get direction => text()(); // Inflow, Outflow, Transfer
  TextColumn get paymentMethod => text().withDefault(const Constant('Cash'))(); // Cash, Bank, UPI
  TextColumn get referenceNo => text().nullable()();
  TextColumn get notes => text().nullable()();
  
  TextColumn get createdBy => text().withDefault(const Constant('Owner'))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  TextColumn get updatedBy => text().nullable()();
  DateTimeColumn get updatedAt => dateTime().nullable()();
  
  BoolColumn get isDeleted => boolean().withDefault(const Constant(false))(); // Soft delete flag
  IntColumn get reversalOfTransactionId => integer().nullable()(); // Correction link
}

/// Audit Log Table (Financial transparency & non-repudiation)
class AuditLogs extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get transactionId => integer().nullable()();
  TextColumn get action => text()(); // Create, Edit, SoftDelete, Reversal
  TextColumn get oldValueJson => text().nullable()();
  TextColumn get newValueJson => text().nullable()();
  TextColumn get userId => text()();
  DateTimeColumn get timestamp => dateTime().withDefault(currentDateAndTime)();
}
