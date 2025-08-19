# 💎 MySQL Functions Practice — Jewelry Retail (Order Fulfillment)

Practice core **MySQL functions** (strings, dates, math, NULL/conditionals, aggregation) on a compact dataset from the **jewelry retail** industry. The SQL file in this repo creates the schema, seeds data, and includes tasks.

---

## 🔎 What this project covers (why it matters)
- **Reporting-ready formatting** (clean strings, case transforms, concatenation)
- **Operations & logistics** (weekday names, ETAs, pending vs delivered)
- **Finance accuracy** (rounding, per-unit price, handling fee)
- **Data quality checks** (NULL handling, variance between expected vs recorded totals)

These are everyday skills for BI/analytics: producing executive-friendly outputs, estimating delivery timelines, and validating order totals.

---

## 🧭 What I solved
- Built queries that **compose readable labels**: `item – quantity – ORDER STATUS`
- Extracted **weekday names** for delivery scheduling
- Computed **handling fees** and **per-unit prices** with correct rounding
- Filtered out **NULL delivery dates** and flagged **PENDING** vs **DELIVERED**
- Summarized orders by **month** and compared **expected vs recorded totals**
- Produced a compact **practice set** you can reuse to drill MySQL functions fast

---

## 🗂️ Tables at a glance (joined preview)
> Minimal preview of the two tables joined; see the `.sql` file for full definitions and data.

| OrderID | ItemName         | Quantity | OrderDate   | DeliveryDate | OrderStatus  | Cost   |
|--------:|------------------|---------:|------------:|--------------|--------------|-------:|
| 1       | Engagement ring  | 50       | 2022-04-05  | 2022-05-25   | Delivered    | 122000 |
| 2       | Silver brooch    | 75       | 2022-03-08  | *(NULL)*     | In progress  | 28000  |
| 3       | Earrings         | 80       | 2022-05-19  | 2022-06-08   | Delivered    | 25000  |

---
