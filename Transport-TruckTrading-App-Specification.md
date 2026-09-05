# Digital Business History & Transaction System
## Product Specification & Phase-Wise Implementation Plan
### For Transport & Truck Trading/Scrap Businesses

---

## PART 1 — Executive Summary

This is not a bookkeeping app. It is a **structured historical database** of two family businesses (Transport, and Truck Buying/Reselling/Scrapping), wrapped in an interface so simple it feels like a digital notebook.

Every screen exists to answer one of these questions later: *What happened? When? With whom? Which vehicle/trip/deal? How much money? Received or pending? Profit or loss?*

Design philosophy:
- **Database first, UI second.** The schema must capture real-world relationships (one truck → many parts → many buyers) even though the UI never shows the word "ledger."
- **Everyday language, accounting-grade data.** The father picks "Diesel" or "Money Received"; underneath, the system records proper debit/credit-equivalent entries.
- **Nothing is ever silently lost.** Soft-delete and correction entries only — never hard deletes of financial history.
- **Simple today, extensible tomorrow.** Custom categories, flexible fields, and a local-first schema seamlessly synced to the user's Google Account.

---

## PART 2 — Recommended Product Architecture

**Pattern: Company → Master Data → Universal Transaction Engine → Context Views (Trip/Deal) → Reports**

Rather than building "Transport Module" and "Truck Trading Module" as separate apps, build **one Transaction Engine** shared by both businesses, with two **context types** layered on top:

- `Trip` context (Transport)
- `Deal` context (Truck Trading)

Every transaction optionally attaches to a context (Trip or Deal), a Vehicle, and a Person. This is what lets a single "Diesel expense" or "Payment received" record roll up into trip P&L, vehicle history, person ledger, and company totals simultaneously — one entry, many views. This is the single most important architectural decision in this whole spec: **avoid duplicate parallel transaction tables for each business.**

---

## PART 3 — Business Model

Two companies, one shared engine:

| | Transport | Truck Trading/Scrap |
|---|---|---|
| Core unit of work | Trip | Deal |
| Revenue | Freight/Customer payment | Sale of vehicle/parts |
| Direct costs | Diesel, toll, driver, repair | Purchase price, labour, transport, repair |
| Key relationship | Customer ↔ Trip | Truck ↔ multiple part-sales |
| Output metric | Profit per trip/truck/customer/route | Profit per deal/part/truck-type |

Both businesses share: People, Vehicles, Categories, Payment Accounts, Attachments, Company-level dashboards. They do **not** share Trips or Deals (those are business-specific contexts).

---

## PART 4 — Information Architecture

**Home Screen = Company Selector**

```
MY BUSINESSES
[ Transport Business ]   → last activity, quick stats
[ Truck Trading ]        → last activity, quick stats
[ + Add Company ]
```

**Should People/Vehicles/Accounts be shared across companies?**

- **People: SHARED globally.** A driver, a scrap dealer, a customer — the father knows them as one person regardless of business. A single "Rahul" record with multiple roles (Driver in Transport, Buyer in Trading) avoids duplicate contacts and lets a person's full financial relationship (what he owes across *both* businesses) be seen in one profile. Each transaction still records *which company* it belongs to, so books stay separable for reporting/tax.
- **Vehicles: SEPARATE per business, with a cross-link.** A transport truck (owned, used for freight) is conceptually different from a trading truck (bought to dismantle/resell) — different lifecycle, different fields, different statuses. But if a transport truck is later sold into the trading business, allow linking the two vehicle records rather than losing history.
- **Payment Accounts (Cash/Bank/UPI): SHARED**, since the father physically has one wallet and one bank account regardless of which business the money is for. Every transaction still tags a company, so account statements can be filtered per business even though the underlying cash is one.
- **Categories: SHARED pool, company-filterable.** "Diesel" applies to both businesses' vehicles; "RTO Expense" might too. Let categories optionally be tagged "applies to: Transport / Trading / Both" but stored once so there's no duplicate category sprawl.

**Rationale:** This shared-master/separated-transaction model mirrors standard accounting and multi-company ERP setups — one Contact/Item master, separate transactional ledgers per company.

---

## PART 5 — Navigation Structure

**Recommendation: Bottom Navigation (4–5 items) + Floating Action Button (Record) + Cards on Dashboard.**

Why not a drawer or deep tab structure: the father needs *zero cognitive load* to find "add a transaction." Drawers hide things behind a gesture; tabs at the top get lost while scrolling. Bottom nav keeps 4–5 destinations always visible with large touch targets.

```
[ Home/Dashboard ] [ Record (FAB, center, raised) ] [ History ] [ People/Vehicles ] [ More ]
```

- **Home** = today's snapshot + recent activity feed (this doubles as the notebook feel)
- **Record (FAB)** = the single most-used action, always one tap away from anywhere
- **History** = search + timelines (Part 12)
- **People/Vehicles** = master data, merged into one tab with a toggle, since both are "who/what" lookups
- **More** = Reports, Import/Export, Documents, Settings — lower-frequency actions, fine to bury one level

Trips and Deals are **not** top-level nav items — they are entered from Record (start new trip/deal) and viewed from Home's "Active Trips/Deals" cards and from History. This avoids a 6th nav item and keeps the mental model at "record things, look things up."

---

## PART 6 — Complete Feature List

**Master Data:** Companies, People (multi-role), Vehicles, Vehicle Parts, Categories (extensible), Payment Accounts, Materials/Routes (transport), Locations.

**Transactions:** Universal record engine, custom categories, attachments, edit with audit trail, soft-delete/reversal.

**Transport:** Trip creation & lifecycle, trip expense/income capture, trip timeline, customer/vehicle/driver/route analytics.

**Truck Trading:** Deal creation (purchase), expense capture, multi-party part-sale capture, deal→part→sale linkage, deal P&L.

**Cross-cutting:** Global + contextual search, filters, dashboards, reports, Excel import/export, document/photo attachments, PIN/biometric lock, roles & permissions, audit trail, offline-first sync, backup/restore.

---

## PART 7 — Company Structure

Each Company record stores: name, business type (Transport / Trading / Other), default currency, active status, created date. Company acts as the top-level partition for transactions, trips/deals, and reporting — but not for People/Categories/Accounts (shared, per Part 4).

Company Dashboard is the landing page after selection (see Part 5), showing today's activity, quick totals, and shortcuts to Record and Active Trips/Deals.

---

## PART 8 — Transaction Architecture

**This is the heart of the system.**

### Transaction Types (user-facing, extensible)
Money Received, Money Paid, Advance Given, Advance Received, Income, Expense, Purchase, Sale, Diesel, Oil, Repair, Toll, Labour, Transport Expense, Vehicle Expense, Other — plus any custom category the father adds.

Underneath, each type maps to a **Direction** (Inflow / Outflow / Internal Transfer) and a **Nature** (Income / Expense / Asset movement / Liability movement) so reports and simple double-entry bookkeeping can be derived automatically — the father never sees these labels.

### Field Design — Mandatory vs Optional

| Field | Mandatory? | Notes |
|---|---|---|
| Date | Yes | Defaults to today |
| Company | Yes | Pre-selected from context |
| Transaction Type/Category | Yes | Core of the record |
| Amount | Yes | |
| Time | No | Auto-captured, editable |
| Person/Party | No | Required only for Payment/Advance types |
| Vehicle | No | Required only when logically relevant |
| Trip/Deal | No | Auto-filled if entered from within a trip/deal |
| Payment method (Cash/Bank/UPI) | No | Defaults to "Cash" or last-used |
| Reference number | No | |
| Notes | No | |
| Attachments | No | |
| Created by/timestamp | Auto | Never user-entered |

**Design rule:** only Date, Company, Category, Amount are hard-required. Everything else defaults intelligently or stays optional — this is what makes 10-second entry possible.

### Categories are user-extensible
"+ Add New Category" creates a new `TransactionCategory` row (name, type/direction, applicable company scope) that appears in future pickers immediately, sorted by recency/frequency of use.

---

## PART 9 — Transport Module

**Trip lifecycle:** Draft → Active → Delivered → Closed (fully paid) → (or Cancelled).

**Create Trip:** Customer → Vehicle → Driver → Origin → Destination → Material → Freight amount. All fields except Customer and Vehicle can be filled in later — a trip can be created with minimal info and enriched as it progresses (realistic: freight rate is sometimes only finalized after delivery).

**During the trip**, every expense/income screen listed (advance, diesel, oil, toll, repair, driver advance, misc, customer payment) is just a "Record Transaction" pre-filled with this Trip and Vehicle — no separate forms to build.

**Trip Timeline** (auto-generated from transactions + status changes):
```
Sep 10 — Trip created (Customer: ABC Ltd, Truck: RJ14-XX)
Sep 10 — Advance received ₹20,000
Sep 10 — Diesel ₹8,000
Sep 11 — Toll ₹1,500
Sep 12 — Repair ₹3,000
Sep 14 — Delivery marked complete
Sep 20 — Customer paid ₹40,000
```

**Trip Summary (auto-calculated, never manually entered):**
Total Income, Total Expenses, Net Profit, Amount Received, Amount Outstanding.

**Views:** Trip List (Active/Completed/Cancelled tabs), Vehicle-wise, Customer-wise, Driver-wise, Route-wise profitability — all are just filtered/grouped queries over the same transaction table joined to Trip.

---

## PART 10 — Truck Trading/Scrap Module

**Deal lifecycle:** Purchased → In Progress (dismantling/repair) → Partially Sold → Fully Sold/Closed.

**Create Deal (Purchase):** Seller, Vehicle, Purchase date, Purchase amount, Deal type (Scrap / Resale).

**Expenses:** Repair, Labour, Transportation, Cutting, RTO, Misc — recorded exactly like Trip expenses, linked to this Deal.

**Sales — the critical relationship:** When the truck is broken into sellable units, the system creates **VehicleComponent** records (Engine, Gearbox, Cabin, Body, Chassis, Tyres, Other — extensible) under the parent Vehicle. Each sale transaction links to: this Deal + the specific Component (or "whole vehicle") + the Buyer.

```
Deal #000001 — Purchase: RJ14-YY, ₹2,00,000
 ├─ Expense: Cutting ₹5,000
 ├─ Expense: Labour ₹3,000
 ├─ Sale: Engine → Person A → ₹80,000
 ├─ Sale: Body → Person B → ₹40,000
 ├─ Sale: Cabin → Person C → ₹35,000
 └─ Sale: Tyres → Person D → ₹15,000
```

**Deal P&L (auto-calculated):**
Purchase Cost + Additional Expenses = Total Investment. Sum of all Sales = Total Revenue. Total Revenue − Total Investment = Profit/Loss. Unsold components show as "Inventory value pending" until sold.

This same structure handles the "sell whole truck to one person" case — it's simply one Sale transaction against the "whole vehicle" component instead of several.

---

## PART 11 — Master Data

- **Person**: name, phone, role(s) as a multi-select tag list (Customer/Supplier/Driver/Mechanic/Scrap Dealer/Buyer/Seller/Broker/Employee/Other), notes, documents. One row, many roles, many transactions — profile aggregates receivable/payable/history/related vehicles/trips/deals across roles.
- **Vehicle** (Transport): Reg. number, make, model, type, owner, purchase date/price, status (Active/Under Repair/Sold/Retired).
- **Vehicle** (Trading): Reg. number (if available), make/model, chassis/engine number, condition (Running/Non-running/Scrap), current status (Owned/Dismantling/Partially Sold/Sold), linked Deal.
- **VehicleComponent**: parent vehicle, component type, status (Unsold/Sold), linked sale transaction.
- **TransactionCategory**: name, direction, scope (company/global), created-by-user flag.
- **PaymentAccount**: name, type (Cash/Bank/UPI/Other), running balance.
- **Material / Route / Location** (Transport, optional lightweight lookup tables for analytics).

---

## PART 12 — History & Search

**Every entity has a "profile" page that is really a filtered transaction feed:**

`SEARCH: RJ14-1234` → Purchase → Repair → Diesel entries → Transport cost → Engine sale → Body sale → Tyre sale → computed Net Profit — literally just `SELECT * FROM Transaction WHERE vehicle_id = X ORDER BY date`, joined with Deal/Trip context, rendered as a timeline.

`SEARCH: ABC Ltd` → all trips, all freight income, all payments, outstanding balance, total profit generated — same pattern, filtered by person_id + role=Customer.

**Global search** (single search bar, top-level) matches across: vehicle numbers, person names, category names, notes/reference text, and amounts (numeric-aware, e.g. "5000" matches ₹5,000 transactions ±tolerance). **Contextual search** (inside a Trip, Deal, or Person page) is scoped automatically to that entity's related records.

This is achievable because every transaction always carries foreign keys to Company, Person, Vehicle, and Trip/Deal — history isn't a separate feature to build, it's a *view* over well-linked data. This is why correct linking in Part 8/18 matters more than any UI polish.

---

## PART 13 — Import/Export

**Export (MVP):** Full transaction export, filtered by date range/company/vehicle/trip/deal/person, to `.xlsx`. Pre-built exports: Customer Ledger, Supplier Ledger, Vehicle History, Trip History, Deal History, Outstanding Balances.

**Import (Phase 2, needed for historical backlog):**
1. Select Excel file
2. Preview raw rows
3. Map columns to fields (date, amount, category, person, vehicle, etc.) — save mapping as a template for repeat imports
4. Validate (missing required fields, unrecognized categories/people — offer inline "create new" resolution)
5. Show errors row-by-row, allow fix-and-retry
6. Confirm
7. Import
8. Summary: X imported, Y skipped, Z flagged for review

**Duplicate detection:** hash of (date + amount + category + person/vehicle + company) flags likely duplicates for manual confirm rather than silently skipping or silently double-importing — financial data should never be auto-merged without the user seeing it.

---

## PART 14 — Dashboard & Analytics

**Transport Dashboard:** Today's income/expenses, monthly income/expenses/profit, active vs completed trips, outstanding customer payments, diesel/repair expenditure, profit per truck/trip/customer/route.

**Truck Trading Dashboard:** Vehicles owned/purchased/sold/scrap, current inventory value (unsold components' allocated cost), total investment vs sales vs profit, outstanding payments, active deals, best/worst performing deals.

**Overall Dashboard** (across both companies): combined cash position, total receivables/payables, this month's combined profit — useful since money is genuinely shared (Part 4).

All figures are derived, never manually entered — this is what makes the dashboard trustworthy and low-maintenance.

---

## PART 15 — Reports

**MVP (Phase 1–ish):** Daily transaction report, Cash report, Customer ledger, Vehicle ledger, Trip profitability, Deal profitability, Outstanding receivables/payables, Category-wise expenses.

**Phase 2:** Bank report, Supplier ledger, Vehicle-wise expenses, Customer-wise revenue, Monthly P&L, custom date-range reports.

**Phase 3:** Driver-wise performance, route profitability trends, cross-company combined statements.

Rationale for staging: MVP reports are the ones the father would otherwise be flipping through a handwritten register for daily; the rest are analytical/managerial and matter once enough data volume exists to make them meaningful.

---

## PART 16 — Document Management

Attachments (bills, receipts, LR, RC, challans, photos) attach to a **Transaction** (primary link) and optionally to a **Vehicle** or **Person** (for RC, license, ID proof type documents that aren't tied to one money event). Store as: file blob in cloud object storage (not the database itself), with a metadata row (filename, type, linked entity, uploaded-by, timestamp) in the DB. Multiple attachments per transaction. Thumbnail previews for images; icon+filename for PDFs.

---

## PART 17 — Security & Audit

- **Login (Mandatory):** Google Sign-In is required to start and access the application. The user logs in with their Google Account, which authenticates them and ties all local data sync and cloud backups directly to their Google Account. Quick PIN/biometric unlock can be enabled after the initial login.
- **App lock:** PIN/biometric on open, and after inactivity.
- **Roles:** Owner (father) — full access; Assistant/Son (you) — full access initially; future Driver role — restricted to logging trip expenses only, no visibility into other trips/financials.
- **Audit trail:** every Create/Edit/Delete on a Transaction logs old value, new value, who, when. Never overwritten.
- **Deletion policy:** financial transactions are **soft-deleted** (flagged inactive, excluded from totals) or corrected via a **reversal entry**, never hard-deleted. This guarantees historical totals can always be reconstructed and reconciled.
- **Backup:** automatic cloud backup (daily) + on-demand manual export as a safety net.

---

## PART 18 — Database Architecture

**Core entities (conceptual, not final DDL):**

**Company** — PK: company_id. Fields: name, type, currency, is_active.

**Person** — PK: person_id. Fields: name, phone, notes, is_active. Roles stored in a separate join table `PersonRole(person_id, role, company_id nullable)` to support multi-role without schema changes.

**Vehicle** — PK: vehicle_id. FK: company_id, owner_person_id (nullable). Fields: reg_number, make, model, type, chassis_no, engine_no, purchase_date, purchase_price, status, business_context (Transport/Trading), notes. Indexed on reg_number for search.

**VehicleComponent** — PK: component_id. FK: vehicle_id (parent). Fields: component_type (Engine/Body/Cabin/Tyres/Whole/Other), status (Unsold/Sold), sale_transaction_id (nullable FK). This table is what lets one vehicle decompose into N sellable units, each traceable back to the parent.

**TransactionCategory** — PK: category_id. Fields: name, direction (Inflow/Outflow/Transfer), scope_company_id (nullable = global), is_user_created.

**PaymentAccount** — PK: account_id. Fields: name, type (Cash/Bank/UPI), opening_balance, is_active. Shared across companies (Part 4).

**Trip** — PK: trip_id. FK: company_id, customer_person_id, vehicle_id, driver_person_id. Fields: origin, destination, material, freight_amount, status, created_at.

**TruckDeal** — PK: deal_id. FK: company_id, vehicle_id, seller_person_id. Fields: deal_type (Scrap/Resale), purchase_amount, purchase_date, status.

**Transaction** — PK: transaction_id. FK: company_id (required), category_id (required), person_id (nullable), vehicle_id (nullable), trip_id (nullable), deal_id (nullable), account_id (nullable), component_id (nullable, for part-specific sales). Fields: date, time, amount, direction, payment_method, reference_no, notes, created_by, created_at, updated_by, updated_at, is_deleted (soft-delete flag), reversal_of_transaction_id (nullable — links a correction entry to what it reverses).
Indexes: (company_id, date), (vehicle_id), (trip_id), (deal_id), (person_id), (category_id).

**Attachment** — PK: attachment_id. FK: transaction_id (nullable), vehicle_id (nullable), person_id (nullable). Fields: file_url, file_type, uploaded_by, uploaded_at.

**AuditLog** — PK: log_id. FK: transaction_id (or generic entity_type/entity_id). Fields: action (Create/Edit/SoftDelete), old_value_json, new_value_json, user_id, timestamp.

**How "one truck → many parts → many sales" is represented:** Vehicle (1) → VehicleComponent (many) → Transaction (each Sale transaction points to exactly one component, or to the vehicle directly for whole-vehicle sales). Deal (1) → Transaction (many, both expenses and sales) via `deal_id`. This double-linkage (component AND deal on the sale transaction) is what lets you query "everything about this truck" or "everything about this deal" and get consistent, non-duplicated answers.

---

## PART 19 — Technology Stack Recommendation

**Mobile:** **Flutter** — single codebase for Android/iOS, mature offline-first support (via local SQLite/Drift/Isar), strong for form-heavy business apps, and you won't be blocked by native-module gaps for this use case. React Native is a reasonable alternative if you're already more fluent in JS/React, but Flutter's more consistent cross-platform rendering favors a "simple, large-button" UI like this.

**Local DB:** SQLite (via Drift for Flutter) for offline-first operation — this is non-negotiable given rural/highway connectivity (Part 20).

**Backend, Auth & Sync:** Google Sign-In (via Firebase Auth / Google OAuth) for mandatory user authentication. Data is stored locally in SQLite (Drift) for 100% offline-first speed and zero latency, while automatically backing up and syncing to the user's Google Account (via Firebase Firestore / Cloud Storage or Google Drive AppData folder) whenever an internet connection is available.

---

## PART 20 — Google Account Authentication & Data Storage Architecture

Rather than complex custom servers or heavy ERP integration, the app uses a straightforward **Google Account + Local SQLite** architecture:

1. **Mandatory Google Login on App Launch:** The user must log in with their Google Account to start and use the app. This secures the app, identifies the user, and links all business databases and attachments directly to their Google Account.
2. **Local SQLite Storage (Offline-First):** All transactions, trips, deals, and master data are saved instantly in the device's local SQLite database (via Drift). This ensures zero-latency performance and 100% usability offline on highways or in remote areas.
3. **Google Account Cloud Sync & Backup:** When an internet connection is available, local SQLite data and document attachments are automatically backed up and synced under the user's Google Account (via Firebase Cloud Firestore / Cloud Storage or Google Drive AppData). If the device is lost or changed, logging in with the same Google Account on a new device restores all data seamlessly.
4. **No ERPNext or Custom Server Maintenance:** By avoiding ERPNext and custom server APIs, the app remains fast, simple, self-contained, and completely free of backend server maintenance costs.

---

## PART 21 — Screen-by-Screen App Map

1. **Company Selector** → list + Add Company → tap opens Company Dashboard.
2. **Company Dashboard** → today/month stats, Active Trips/Deals cards, Record FAB, bottom nav.
3. **Record Transaction (sheet/modal)** → type picker (grid of category icons + "+Add New") → form (amount, date, optional fields expand progressively) → Save → confirmation toast → returns to previous screen with updated totals.
4. **Trip/Deal Create** → step form (Customer/Vehicle/Driver/Route or Seller/Vehicle/Price) → Save → opens Trip/Deal Detail.
5. **Trip/Deal Detail** → header summary (Income/Expense/Profit/Outstanding) → timeline feed → "+ Add Entry" (opens Record pre-filled) → Mark Complete/Closed action.
6. **History/Search** → search bar + recent searches → result list (grouped by entity type) → tap opens that entity's timeline.
7. **People/Vehicles (tab)** → toggle list → tap Person/Vehicle → Profile screen (contact/details, balance, related trips/deals, full transaction history, documents).
8. **Reports** → report list → parameter picker (date range, filters) → generated view → Export button.
9. **Import/Export** → Export tab (pick report/range → generate .xlsx → share) / Import tab (Part 13's 8-step wizard).
10. **Documents** → grid/list of all attachments, filterable by entity.
11. **Settings** → Categories management, Payment Accounts, Users/Roles, Backup/Restore, App Lock.

Each screen: empty states show a friendly prompt + big "Add" button (never a blank/confusing void); destructive actions (delete/reverse) always show a confirm dialog naming exactly what will change; after saving, totals visibly update immediately so the father gets instant confirmation the entry "counted."

---

## PART 22 — MVP Definition

**MVP includes:** Single company setup (can add 2nd later), People, Vehicles, default + custom Categories, universal Record Transaction, Trip create/close with timeline & auto P&L, Deal create/close with component-linked sales & auto P&L, basic History/Search by vehicle/person, Excel export (transactions + ledgers), one combined dashboard, PIN lock, soft-delete audit trail.

**Postponed to Phase 2+:** Excel import wizard (start clean, backfill later), advanced reports beyond ledgers/P&L, document/photo attachments (nice-to-have, not blocking), role-based permissions beyond Owner, offline conflict resolution (start single-device, add sync later), multi-account bank reconciliation.

**Rationale:** the father can start replacing his notebook the day Trip/Deal capture + auto-totals + search work — everything else is refinement on top of a live, real dataset.

---

## PART 23 — Phase-Wise Development Roadmap

**PHASE 0 — Discovery & Architecture**
Objective: Finalize this spec, confirm category lists with father, confirm real trip/deal examples from his actual notebook.
DoD: Signed-off schema + wireframes. Nothing built yet.

**PHASE 1 — Foundation**
Objective: Project scaffolding, local DB, auth/PIN lock, Company entity.
Screens: Company Selector, empty Dashboard shell.
DoD: App installs, creates a company, locks/unlocks.

**PHASE 2 — Master Data**
Objective: People, Vehicles, Categories, Payment Accounts CRUD.
DoD: Can add/edit/search a person and a vehicle; default categories seeded; custom category creation works.

**PHASE 3 — Basic Transactions**
Objective: Universal Record Transaction engine (no Trip/Deal linkage yet).
DoD: Can record any transaction type, see it in a plain list, edit/soft-delete with audit log.

**PHASE 4 — Transport**
Objective: Trip entity, Trip Detail timeline, trip-scoped Record, auto P&L.
DoD: Full trip lifecycle from creation to customer payment, correct profit calculation.

**PHASE 5 — Truck Trading/Scrapping**
Objective: TruckDeal, VehicleComponent, deal-scoped Record for expenses and part-sales, auto P&L.
DoD: A deal with 3+ component sales correctly computes total investment/revenue/profit.

**PHASE 6 — History & Search**
Objective: Global + contextual search, entity profile timelines.
DoD: Searching a vehicle number surfaces its full cross-linked history.

**PHASE 7 — Excel Import/Export**
Objective: Export flows (Phase 7a) then Import wizard w/ mapping, validation, dedup (Phase 7b).
DoD: Export produces correct .xlsx ledgers; import round-trips historical sample data without duplication.

**PHASE 8 — Reports & Dashboard**
Objective: MVP report set + Transport/Trading/Overall dashboards.
DoD: All Part 15 MVP reports render correctly against real data.

**PHASE 9 — Documents**
Objective: Attachment upload/view on transactions, people, vehicles.
DoD: Photo of a diesel bill attaches to that transaction and displays in its timeline.

**PHASE 10 — Security, Backup & Audit**
Objective: Roles/permissions, automated backup, restore flow, full audit trail UI.
DoD: A second (restricted) user role can log entries but not see financial totals; backup/restore tested.

**PHASE 11 — Testing**
Objective: Real-world trial with father on live data, bug triage, UX friction removal.
DoD: Father completes a full week of entries unassisted.

**PHASE 12 — Deployment**
Objective: Play Store / internal distribution, Google Account automated cloud backup/sync (Part 20) verified.
DoD: App installed on father's device, backups confirmed running.

**PHASE 13 — Future Improvements** (see Part 26).

---

## PART 24 — Testing Strategy

- **Unit tests:** P&L calculation logic (Trip and Deal), category/direction mapping, dedup-detection hash.
- **Integration tests:** Transaction→Trip/Deal→Vehicle→Person linkage integrity; soft-delete never affects historical totals incorrectly.
- **Offline/sync tests:** create records offline, verify sync on reconnect, verify no duplicate/lost records.
- **UAT with father:** the real test — sit with him, watch him try to log a real trip/deal unassisted, note every hesitation point.
- **Data migration tests:** sample historical Excel import producing correct records with zero silent data loss.

---

## PART 25 — Deployment Strategy

Start as an internal/private distribution (APK sideload or Play Store internal testing track) — no need for public listing. Authentication and cloud storage are powered by Google Sign-In and Google Account Cloud Sync (Firebase Auth / Cloud Storage). Data is saved locally in SQLite for instant offline use and synced automatically whenever connected to the internet. Nightly cloud backups to the user's Google Account ensure complete data protection without needing server administration.

---

## PART 26 — Future Roadmap

OCR for bills, scan-to-digitize handwritten historical records, voice entry (high value given father's comfort level — worth prioritizing once core app is stable), WhatsApp integration for quick photo/expense capture, GPS-based trip tracking, driver mobile access (restricted role), customer portal, automated payment reminders, GST/e-way bill export, AI-assisted analytics ("where are we losing money" style insights), predictive maintenance from repair history, fuel efficiency analysis (once odometer data is captured).

None of these affect the core schema — they're additive, which is exactly why the Part 18 schema needs to be right now.

---

## PART 27 — Risks & Design Decisions

| Decision | Trade-off | Why chosen |
|---|---|---|
| Shared People/Accounts, separate Vehicles/Trips/Deals per company | Slightly more complex company-filtering logic | Matches real-world identity (one person, one wallet) vs. business-specific assets |
| Simple category labels over exposed double-entry | Underlying accounting rigor is hidden, needs care in schema design | Father must never see accounting jargon; underlying data remains structured |
| Soft-delete/reversal only, never hard delete | More storage, slightly more complex "current totals" queries | Non-negotiable requirement: history can never silently disappear |
| Offline-first local SQLite + Google Account sync | Requires local-to-cloud sync handling | Highway/rural connectivity makes online-only unusable; data stays local and backs up to Google Account |
| Flutter over React Native | Team must learn Dart if not already familiar | More consistent UI rendering for a simple, large-button design across devices |
| Mandatory Google Sign-In | User must log in with Google to start app | Ensures data security, account ownership, and seamless cloud restore on new devices |
| One universal Transaction table vs. separate tables per type | Slightly more complex queries (filter by category/context) | Enables the History/Search feature to work "for free" across every entity |

**Key risk to watch:** scope creep into exposing complex accounting jargon — resist this; the core value of this app is notebook-like simplicity backed by clean structured data.

---

## PART 28 — Recommended Next Step

1. Validate this spec with your father using his **actual notebook** — walk through 2–3 real historical trips and 1–2 real truck deals, and map every line he wrote to a field in Part 8/9/10. This will surface any missing category or field before a line of code is written.
2. Lock the MVP scope (Part 22) — resist adding Phase 2/3 items.
3. Set up Phase 0/1 (Flutter project + Google Sign-In setup + local SQLite schema from Part 18).
4. Build Phase 2 (Master Data) next, since every later phase depends on it.

I'm ready to help draft the actual Flutter project structure, the SQLite/Postgres schema DDL, or detailed wireframes for specific screens whenever you want to move past this planning stage — just say which one.
