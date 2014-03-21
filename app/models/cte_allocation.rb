class CteAllocation < ActiveRecord::Base

  validates :weight, presence: true
  validates :ferro_cte, :rodo_cte, presence: true

  belongs_to :ferro_cte
  belongs_to :rodo_cte
end
