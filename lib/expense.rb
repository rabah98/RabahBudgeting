class Expense
  attr_accessor :amount, :category, :note

  def initialize(amount:, category:, note:)
    @amount = amount.to_f
    @category = category
    @note = note
  end
end