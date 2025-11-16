require_relative "expense"

class BudgetManager
  attr_accessor :monthly_budget, :expenses, :investment_goal, :investment_progress

  def initialize(monthly_budget:, investment_goal:)
    @monthly_budget = monthly_budget.to_f
    @expenses = []
    @investment_goal = investment_goal.to_f
    @investment_progress = 0.0
  end

  # Add a new expense
  def add_expense(amount:, category:, note:)
    @expenses << Expense.new(amount: amount, category: category, note: note)
  end

  # List all expenses
  def list_expenses
    if @expenses.empty?
      puts "No expenses recorded."
    else
      @expenses.each_with_index do |expense, index|
        puts "#{index + 1}. [#{expense.category}] $#{'%.2f' % expense.amount} - #{expense.note}"
      end
    end
  end

  # List expenses by category
  def list_by_category(category)
    filtered = @expenses.select { |e| e.category.downcase == category.downcase }
    if filtered.empty?
      puts "No expenses in category '#{category}'."
    else
      filtered.each_with_index do |expense, index|
        puts "#{index + 1}. $#{'%.2f' % expense.amount} - #{expense.note}"
      end
    end
  end

  # Calculate total spent
  def total_spent
    @expenses.sum { |e| e.amount }
  end

  # Calculate remaining budget
  def remaining_budget
    @monthly_budget - total_spent
  end

  # Show investment potential
  def show_investment_progress
    puts "Investment Goal: $#{'%.2f' % @investment_goal}"
    puts "Invested So Far: $#{'%.2f' % @investment_progress}"
    remaining_goal = @investment_goal - @investment_progress
    remaining_goal = 0 if remaining_goal < 0
    puts "Remaining to Goal: $#{'%.2f' % remaining_goal}"
  end

  # End of month processing
  def end_month
    leftover = remaining_budget
    if leftover > 0
      @investment_progress += leftover
      puts "🎉 $#{'%.2f' % leftover} added to investment goal!"
    else
      puts "Budget exceeded. No money added to investment."
    end
    @expenses.clear
    puts "Monthly expenses reset. Ready for next month!"
  end
end