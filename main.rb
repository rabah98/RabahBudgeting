require_relative "lib/budget_manager"

class RabahBudgetingCLI
  def initialize
    setup_budget
    @running = true
  end

  def setup_budget
    print "Enter your monthly budget: $"
    monthly_budget = gets.chomp.to_f
    print "Enter your investment goal: $"
    investment_goal = gets.chomp.to_f
    @manager = BudgetManager.new(monthly_budget: monthly_budget, investment_goal: investment_goal)
    puts "\n✅ RabahBudgeting is ready!\n\n"
  end

  def start
    while @running
      show_menu
      handle_choice
    end
  end

  def show_menu
    puts "\nChoose an option:"
    puts "1. Add expense"
    puts "2. List all expenses"
    puts "3. List expenses by category"
    puts "4. Show remaining budget"
    puts "5. Show investment goal progress"
    puts "6. Delete an expense"
    puts "7. End month"
    puts "8. Exit"
    print "> "
  end

  def handle_choice
    choice = gets.chomp
    case choice
    when "1" then add_expense
    when "2" then @manager.list_expenses
    when "3" then list_by_category
    when "4" then show_remaining
    when "5" then @manager.show_investment_progress
    when "6" then delete_expense
    when "7" then @manager.end_month
    when "8" then exit_program
    else
      puts "❌ Invalid option. Try again."
    end
  end

  def add_expense
    print "Amount: $"
    amount = gets.chomp.to_f
    print "Category (food, rent, gas, etc.): "
    category = gets.chomp
    print "Note: "
    note = gets.chomp
    @manager.add_expense(amount: amount, category: category, note: note)
    puts "✅ Expense added!"
  end

  def list_by_category
    print "Enter category: "
    category = gets.chomp
    @manager.list_by_category(category)
  end

  def show_remaining
    remaining = @manager.remaining_budget
    color = if remaining > 0
              "\e[32m" # green
            elsif remaining < 0
              "\e[31m" # red
            else
              "\e[33m" # yellow
            end
    puts "Remaining budget: #{color}$#{'%.2f' % remaining}\e[0m"
  end

  def delete_expense
    @manager.list_expenses
    print "Enter expense number to delete: "
    num = gets.chomp.to_i
    if num.between?(1, @manager.expenses.length)
      removed = @manager.expenses.delete_at(num - 1)
      puts "✅ Deleted: [#{removed.category}] $#{'%.2f' % removed.amount} - #{removed.note}"
    else
      puts "❌ Invalid expense number."
    end
  end

  def exit_program
    puts "Goodbye! 💰"
    @running = false
  end
end

# Start the CLI
RabahBudgetingCLI.new.start