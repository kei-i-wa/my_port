class Point < ApplicationRecord
  default_scope -> { order(created_at: :desc) }
  belongs_to :post
  belongs_to :giver, class_name: 'User', foreign_key: 'giver_id', optional: true
  belongs_to :getter, class_name: 'User', foreign_key: 'getter_id', optional: true
end
