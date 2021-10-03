class Point < ApplicationRecord
  belongs_to :post
  belongs_to :giver, class_name: 'User', foreign_key: 'giver_id', optional: true
  belongs_to :getter, class_name: 'User', foreign_key: 'getter_id', optional: true

  scope :created_days_ago, ->(n) { where(created_at: n.days.ago.all_day) }

end
