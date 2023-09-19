# app/models/quote.rb

class Quote < ApplicationRecord
   # All the previous code
  has_many :line_item_dates, dependent: :destroy
  has_many :line_items, through: :line_item_dates

  scope :ordered, -> { order(created_at: :asc) }  # Example ordering by created_at attribute
  
   # after_create_commit -> { broadcast_prepend_later_to "quotes" }
   # after_update_commit -> { broadcast_replace_later_to "quotes" }
   # after_destroy_commit -> { broadcast_remove_to "quotes" }
   # Those three callbacks are equivalent to the following single line
   broadcasts_to ->(quote) { "quotes" }, inserts_by: :prepend
  
   
   def total_price
    line_items.sum(&:total_price)
  end

 end