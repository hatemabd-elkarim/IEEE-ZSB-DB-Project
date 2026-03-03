# ER-to-Relational Mapping Steps for Wagba Food Delivery System

---

## Mapping Flow

```
1. Strong Entities
2. Binary Relationships (1:1)
3. Binary Relationships (1:M)
4. Binary Relationships (M:N)
5. Unary Relationships (if any)
6. Ternary Relationships (if any)
```

---

## Phase 1: Mapping Strong Entities

All entities in the Wagba ERD are **strong entities** (no weak entities present).

### Step 1.1: Handle Special Attributes

#### Multivalued Attributes

**Rule:** Create a separate table with the entity's PK as FK

**Example: Customer.{phone_number}**

**Customer_Phone**
| Column | Type | Constraints |
|--------|------|-------------|
| customer_id | FK | PK, References Customer |
| phone_number | String | PK |

---

#### Composite Attributes

**Rule:** Break down into simple attributes (x, y, z) → x, y, z

**Example 1: Customer.(address) = (street, building, floor, gps_coordinates)**

- Break into: `street`, `building`, `floor`, `gps_coordinates`

**Example 2: Delivery_Captain.(vechicle) = (vechicle_type, plate_number, vechicle_capacity)**

- Break into: `vechicle_type`, `plate_number`, `vechicle_capacity`

---

#### Derived Attributes

**Rule:** Do NOT include in tables (calculated at runtime)

**Example: Customer.[wallet]**

- Not stored in table
- Calculated from Wallet_Transaction table when needed

---

#### Complex Attributes (Multivalued + Composite)

**Rule:** Same as multivalued - create separate table with broken-down attributes

**Example: If {complex(x, y, z)} existed**

- Create separate table
- Include x, y, z as columns
- Add FK to parent entity

---

## Phase 2: Mapping Binary Relationships (1:1)

### Classification of 1:1 Relationships

| Type                       | Participation        | Mapping Strategy                         |
| -------------------------- | -------------------- | ---------------------------------------- |
| **A: Mandatory-Mandatory** | Total-Total (││││)   | Merge into one table                     |
| **B: Mandatory-Optional**  | Total-Partial (││◯)  | Two tables, FK from mandatory → optional |
| **C: Optional-Optional**   | Partial-Partial (◯◯) | Three tables (prevent NULLs)             |

### Status in Wagba ERD

** No 1:1 relationships present in this ERD**

---

## Phase 3: Mapping Binary Relationships (1:M)

**Rule Summary**

- If participation on the **M side is OPTIONAL** → use a **bridge table**.
- If participation on the **M side is MANDATORY** → place the **FK in the M-side table**.

---

# Case 1: 1:M where M is OPTIONAL

## Example: Delivery_Captain (1) —— (M) Order

### ER Meaning

- One captain can deliver many orders.
- An order may exist without a captain (e.g., still pending).
- So participation of **Order** is optional.

### ER Visualization

Delivery_Captain (1) ───── assigns ───── (M) Order  
Order (optional participation)

To avoid NULL captain_id inside Order, we create a bridge table.

---

### Table Structure

---

### Delivery_Captain
| Column       | Key |
|--------------|-----|
| captain_id   | PK  |
| name         |     |
| vehicle_type |     |
| is_available |     |

---

### Order
| Column     | Key |
|------------|-----|
| order_id   | PK  |
| ordered_at |     | 
| status     |     |

---

### Order_Assignment
| Column        | Key       |
|---------------|-----------|
| order_id      | PK, FK    |
| captain_id    | FK        |
| base_pay      |           |
| bonus         |           |
| captain_rating|           |


---

# Case 2: 1:M where M is MANDATORY

## Example: Branch (1) —— (M) Item

### ER Meaning

- One branch has many items.
- Every item MUST belong to exactly one branch.
- So participation of **Item** is mandatory.

### ER Visualization

Branch (1) ───── contains ───── (M) Item  
Item (total participation)

No bridge table needed.

---

### Table Structure

### Branch
| Column     | Key |
|------------|-----|
| branch_id  | PK  | 
| location   |     |
| open_at    |     |
| close_at   |     |

---

### Item
| Column     | Key        |
|------------|------------|
| item_id    | PK         |
| name       |            |
| price      |            |
| is_available |          |
| branch_id  | FK, NOT NULL |
---

## Phase 4: Mapping Binary Relationships (M:N)

**Rule:** Always create a third (bridge/junction) table to prevent data duplication

**Why Bridge Table is Necessary:**

**Without Bridge Table:**

- Order table would have repeating Item data → Violates 1NF
- Item table would have repeating Order data → Violates 1NF
- No place to store relationship attributes (quantity, ratings)

**With Bridge Table:**

- Clean separation
- Relationship attributes stored properly
- No data duplication
- Maintains referential integrity

## Example: Order and Item (M:M Relationship)

- Keep Order table as is
- Keep Item table as is
- **Create new bridge table: Order_Item**

### ER Visualization

Order (M) ───── contains ───── (M) Item

(Many-to-Many relationship → requires associative entity)

---

### New Bridge Table:

**Order_Item**

| Column            | Constraints    |
| ----------------- | -------------- |
| order_id          | PK, FK → Order |
| item_id           | PK, FK → Item  |
| quantity          | NOT NULL       |
| rating_item       | CHECK (1–5)    |
| rating_restaurant | CHECK (1–5)    |

**Note:** Composite Primary Key (order_id, item_id) prevents duplicate entries

---

## Important Notes

- In the wallet_transaction table, the fk_order_id NULL cases means that the transaction was credit and not related to a food order

- Attributes on relations like ratings should be in the table that contains both of the foreign keys of the two entities
