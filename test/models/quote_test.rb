# test/system/quotes_test.rb

require "application_system_test_case"

class QuotesTest < ApplicationSystemTestCase
  setup do
    login_as users(:accountant)
    @quote = Quote.ordered.first
  end

  test "#total_price returns the sum of the total price of all line items" do
  assert_equal 2500, quotes(:first).total_price
end
  # All the previous code
end
