require "minitest/autorun"
require_relative "../lib/expense"
require_relative "../lib/budget_manager"

class TestRabahBudgeting < Minitest::Test
  def setup
    @budget_manager = BudgetManager.new(monthly_budget: 2000, investment_goal: 5000)
  end

  def test_add_expense
    @budget_manager.add_expense(amount: 100, category: "food", note: "groceries")
    assert_equal 1, @budget_manager.expenses.length
    assert_equal 100, @budget_manager.expenses.first.amount
    assert_equal "food", @budget_manager.expenses.first.category
  end

  def test_total_spent_and_remaining
    @budget_manager.add_expense(amount: 200, category: "rent", note: "October rent")
    @budget_manager.add_expense(amount: 50, category: "gas", note: "fuel")
    assert_equal 250, @budget_manager.total_spent
    assert_equal 1750, @budget_manager.remaining_budget
  end

  def test_end_month_investment
    @budget_manager.add_expense(amount: 1500, category: "rent", note: "month")
    @budget_manager.end_month
    # leftover = 2000 - 1500 = 500
    assert_equal 500, @budget_manager.investment_progress
    # Expenses should reset
    assert_equal 0, @budget_manager.expenses.length
  end
end