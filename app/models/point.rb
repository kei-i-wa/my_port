class Point < ApplicationRecord
  default_scope -> { order(created_at: :desc) }
  belongs_to :post
  belongs_to :giver, class_name: 'User', foreign_key: 'giver_id', optional: true
  belongs_to :getter, class_name: 'User', foreign_key: 'getter_id', optional: true
  
  scope :created_today, -> { where(created_at: Time.zone.now.all_day) }
  scope :created_yesterday, -> { where(created_at: 1.day.ago.all_day) }
  scope :created_2days_ago, -> { where(created_at: 2.days.ago.all_day) }
  scope :created_3days_ago, -> { where(created_at: 3.days.ago.all_day) }
  scope :created_4days_ago, -> { where(created_at: 4.days.ago.all_day) }
  scope :created_5days_ago, -> { where(created_at: 5.days.ago.all_day) }
  scope :created_6days_ago, -> { where(created_at: 6.days.ago.all_day) }

  scope :created_this_1week, -> { where(created_at: 6.day.ago.beginning_of_day..Time.zone.now.end_of_day) }
  scope :created_this_week, -> { where(created_at: Time.zone.now.prev_week(:monday)..Time.zone.now.prev_week(:friday)) }
end
