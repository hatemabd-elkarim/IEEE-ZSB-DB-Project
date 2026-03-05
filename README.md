# Wagba - Food Delivery System Database

A comprehensive database system for a food delivery platform, designed and implemented as part of the **IEEE-ZSB Backend Program**.

[![MySQL](https://img.shields.io/badge/MySQL-4479A1?style=for-the-badge&logo=mysql&logoColor=white)](https://www.mysql.com/)

---

## Project Overview

**Wagba** is a feature-rich food delivery system database that handles the complete lifecycle of food ordering and delivery operations. The system supports multiple restaurants with various branches, customer wallet management, dynamic delivery pricing, promotional codes, charity donations, and comprehensive review systems.

### Key Capabilities

- Multi-restaurant and multi-branch support
- Customer management with multiple addresses and phone numbers
- Captain (delivery driver) assignment and earnings tracking
- Digital wallet system with transaction ledger
- Promotional codes with usage tracking
- Ramadan-specific features (Iftar & Suhour scheduling and surge pricing)
- Charity donation orders
- Multi-level review system (restaurants, items, and captains)
- Deep menu customization with modifiers
- GPS-based address management and delivery zones

---

## Team Members

| Name        | Role               | Contributions                                                                                           |
| ----------- | ------------------ | ------------------------------------------------------------------------------------------------------- |
| **Hatem**   | Team Leader        | System analysis, ERD design, schema review, seed data generation, query filtering, project coordination |
| **Ramadan** | Database Architect | System analysis, ERD design, business logic queries                                                     |
| **Tamer**   | Database Designer  | Mapping, normalization, business logic queries                                                          |
| **Badawy**  | Database Designer  | Mapping, normalization                                                                                  |
| **Sara**    | Schema Developer   | SQL schema creation, seed data generation, business logic queries                                       |
| **Shahd**   | Schema Developer   | SQL schema creation, business logic queries                                                             |

---

## Project Timeline & Milestones

### Milestone 1: System Analysis & ERD Design

**SubTeam:** Hatem & Ramadan  
**Activities:**

- Conducted initial system analysis
- Identified core entities and relationships
- Created Entity-Relationship Diagram (ERD)
- Visualized system architecture
- Established business rules and constraints

**Deliverables:** Complete ERD with all entities, attributes, and relationships

---

### Milestone 2: Mapping & Normalization

**Team:** Tamer & Badawy  
**Activities:**

- Mapped ERD to relational schema
- Applied normalization rules (1NF, 2NF, 3NF)
- Optimized table structures
- Identified primary and foreign keys

**Review Meeting:** Third meeting - simplified schema and removed 3 tables for simplicity

**Deliverables:** Normalized relational schema

---

### Milestone 3: SQL Schema & Data Generation

**Team:** Sara, Shahd & Hatem (Review)  
**Activities:**

- Created SQL schema with all tables
- Implemented CHECK constraints for business rules
- Added foreign key relationships with appropriate CASCADE rules
- Generated comprehensive seed data with interconnected records

**Key Features Implemented:**

- Phone number validation (Egyptian format: 01XXXXXXXXX)
- Time-based constraints (operating hours, delivery pricing)
- Positive amount validations
- Enumerated status types
- Composite foreign keys for delivery zones

**Deliverables:**

- Complete SQL schema file (`wagba_schema.sql`)
- Seed data file (`wagba_seed.sql`) with 50+ orders, 20 customers, 10 captains, 7 branches

---

### Milestone 4: Business Logic Queries

**Team:** All members (3 queries each)  
**Activities:**

- Each team member wrote 3 business logic queries
- Queries reviewed and filtered by team leader
- Finalized 15 production-ready queries

**Query Categories:**

- Revenue and performance analytics
- Customer behavior analysis
- Captain earnings and ratings
- Menu and inventory management
- Promotional tracking
- Wallet balance calculation
- Charity donation reports

**Deliverables:** `business_logic_queries.sql` with 15 comprehensive queries

---

### Milestone 5: Mystery Challenge & Documentation

**Team:** All members  
**Activities:**

- Solved the "Ramadan Mystery" challenge
- Recorded solution demonstration
- Created comprehensive project documentation

**Deliverables:**

- Watch our Ramadan Mystery solution and project walkthrough: [Ramadan Mystery - YouTube](https://youtu.be/jVs4XSG_HEU)

---

## Database Features

### 1. **Multi-Restaurant System**

- Support for multiple restaurant brands
- Multiple branches per restaurant
- Branch-specific menus and operating hours
- Delivery zone management per branch

### 2. **Advanced Menu System**

- Categories and items per branch
- Modifier groups (e.g., size, toppings, sauces)
- Modifier options with price adjustments
- Min/max selection rules for customization
- Item availability tracking

### 3. **Customer Management**

- Multiple phone numbers per customer
- Multiple saved addresses with GPS coordinates
- Digital wallet with transaction ledger
- Order history and reviews

### 4. **Order Processing**

- ASAP orders (immediate delivery)
- Scheduled orders (future delivery time)
- Iftar pre-orders for Ramadan
- Charity donation orders
- Order status tracking (pending → delivered)
- Order-specific address denormalization

### 5. **Delivery System**

- Captain assignment and tracking
- Vehicle information and status
- Earnings calculation (base pay + bonus)
- Captain reviews and ratings
- Delivery zone-based pricing

### 6. **Ramadan-Specific Features**

- **Surge Pricing Rules:**
  - Suhour: 2:00 AM - 3:00 AM (1.25-1.35× multiplier)
  - Suhour Rush: 3:00 AM - 4:30 AM (1.50-1.65× multiplier)
  - Iftar: 5:00 PM - 6:00 PM (1.35-1.45× multiplier)
  - Iftar Rush: 6:00 PM - 7:00 PM (1.65-1.85× multiplier)
- Scheduled Iftar deliveries (around 6:00 PM)
- Charity donation tracking

### 7. **Payment System**

- Multiple payment methods (cash, card, wallet)
- Payment status tracking
- Wallet credit/debit ledger
- Transaction history with order references

### 8. **Promotional System**

- Promo codes with percentage or fixed discounts
- Per-user usage limits
- Global usage limits
- Expiration date tracking
- Usage history per customer

### 9. **Review System**

- Restaurant reviews (1-5 stars)
- Item reviews (1-5 stars)
- Captain reviews (1-5 stars)
- One review per order per entity

---

## Installation & Setup

### Prerequisites

- MySQL 8.0 or higher
- MySQL Workbench (optional, for GUI)

### Setup Instructions

1. **Clone or download the project files**

   ```bash
   git clone https://github.com/hatemabd-elkarim/IEEE-ZSB-DB-Project.git
   cd wagba
   ```

2. **Create the database and schema**

   ```bash
   mysql -u root -p < wagba_schema.sql
   ```

3. **Load the seed data**

   ```bash
   mysql -u root -p wagba < wagba_seed.sql
   ```

4. **Verify the installation**

   ```sql
   USE wagba;
   SHOW TABLES;
   SELECT COUNT(*) FROM `Order`;  -- Should return 54 orders
   SELECT COUNT(*) FROM Customer;  -- Should return 20 customers
   ```

5. **Run business logic queries**
   ```bash
   mysql -u root -p wagba < business_logic_queries.sql
   ```

---



