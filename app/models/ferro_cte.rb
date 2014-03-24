class FerroCte < ActiveRecord::Base

  validates :number, presence: true, numericality: true, uniqueness: {scope: :series}
  validates :series, presence: true
  validates :weight, presence: true

  has_many :cte_allocations, dependent: :destroy
  has_many :rodo_ctes, through: :cte_allocations

  default_scope  { order(number: :asc) }

  def self.unallocated
    joins("LEFT OUTER JOIN cte_allocations ON cte_allocations.ferro_cte_id = ferro_ctes.id")
    .group("ferro_ctes.id")
    .having("sum(cte_allocations.weight) IS NULL OR sum(cte_allocations.weight) < ferro_ctes.weight")
  end

  def self.import(file)
    spreadsheet = Roo::Excel.new(file.path, nil, :ignore)
    header = spreadsheet.row(1)

    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]

      # cleaning data
      ferro_cte_params = {}
      ferro_cte_params[:number] = row['CTE']
      ferro_cte_params[:series] = row['SERIE'].to_i.to_s
      ferro_cte_params[:weight] = row['PESO'].to_f.round(2) * 1000

      FerroCte.create(ferro_cte_params)
    end

    true
  end

  def allocated_weight
    cte_allocations.sum(:weight)
  end

  def weight_balance
    weight - allocated_weight
  end
end
