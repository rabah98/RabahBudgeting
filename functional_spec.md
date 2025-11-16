# RabahBudgeting — Functional Specification

## Introduction

RabahBudgeting is a **Monthly Budget and Investment Goal Tracker CLI** built in Ruby.  
It allows users to set a monthly budget, track expenses by category, and automatically contribute leftover funds to a long-term investment goal at the end of each month.  
This application helps users manage finances in a structured and visual way, right from the command line.

---

## User Stories

1. **As a user**, I want to set my monthly budget, so that I can plan my spending.  
2. **As a user**, I want to add expenses with an amount, category, and note, so that I can track all my spending.  
3. **As a user**, I want to view all my expenses, so that I can see where my money is going.  
4. **As a user**, I want to filter expenses by category, so that I can see spending per type (food, rent, gas, etc.).  
5. **As a user**, I want to see my remaining budget, so that I can know how much I have left to spend.  
6. **As a user**, I want to set an investment goal, so that I can save or invest leftover money.  
7. **As a user**, I want leftover money at the end of the month to automatically contribute to my investment goal, so that I can track progress over time.  
8. **As a user**, I want to delete expenses if I make a mistake, so that my budget remains accurate.  
9. **As a user**, I want color-coded warnings for remaining budget (green/yellow/red), so that I can easily see if I am under, at, or over budget.  
10. **As a user**, I want the month to reset automatically after processing leftover funds, so that I can start fresh each month while keeping investment progress.

---

## Functional Requirements

- **BudgetManager class**  
  - Stores `monthly_budget`, `expenses`, `investment_goal`, `investment_progress`  
  - Methods to add expenses, list expenses, calculate total spent, calculate remaining budget, and process end-of-month logic  

- **Expense class**  
  - Stores `amount`, `category`, `note` for each expense  

- **CLI Menu**  
  - Add expense  
  - List all expenses  
  - List by category  
  - Show remaining budget  
  - Show investment goal progress  
  - Delete an expense  
  - End month (process leftover funds into investment, reset expenses)  
  - Exit  

- **Color-coded remaining budget**  
  - Green = under budget  
  - Yellow = exactly at budget  
  - Red = over budget  

- **Testing**  
  - MiniTest tests included for Expense creation, BudgetManager calculations, and end-of-month logic.

---

## Additional Notes

- Budget and expenses reset each month, but investment progress **accumulates across months**.  
- The CLI is **interactive**, using `gets.chomp` for user input.  
- All monetary values are stored as **floats** to allow accurate calculations.  
- The application is lightweight, console-based, and requires **Ruby** to run.