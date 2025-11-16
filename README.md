# RabahBudgeting 💰

A **Monthly Budget and Investment Goal Tracker CLI** built with Ruby.  
This app allows users to manage their monthly budget, track expenses by category, and automatically contribute leftover money to an investment goal at the end of each month.

---

## Features

- Set your monthly budget
- Add expenses with **amount, category, and note**
- List all expenses
- List expenses by category
- Show **remaining budget** (color-coded warning if overspending)
- Delete an expense
- Set and track an **investment goal**
- End-of-month processing:
  - Leftover budget automatically adds to investment goal
  - Expenses reset for the new month

---

## Installation & Setup

**Clone the repository:**

```bash
git clone https://github.com/rabah98/RabahBudgeting.git
cd RabahBudgeting

## Getting Started

### Run the App

1. Open terminal in your project directory (or Codespace)  
2. Run the app:

```bash
ruby main.rb

### Run Tests

To verify everything works correctly, run:

ruby tests/test_budget_manager.rb

### Usage Example
Enter your monthly budget: $2500
Enter your investment goal: $5000

Choose an option:
1. Add expense
2. List all expenses
3. List expenses by category
4. Show remaining budget
5. Show investment goal progress
6. Delete an expense
7. End month
8. Exit
>

### Built With

Ruby
MiniTest (for testing)

### Author

Rabah Merzoug