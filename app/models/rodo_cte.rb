class RodoCte < ActiveRecord::Base

  validates :number, presence: true, numericality: true, uniqueness: {scope: [:series, :cnpj]}
  validates :series, presence: true
  validates :weight, presence: true
  validates :amount, presence: true
  validates :emitted_at, presence: true
  validates :cnpj, presence: true, numericality: true

  has_many :cte_allocations, dependent: :destroy
  has_many :ferro_ctes, through: :cte_allocations

  default_scope  { order(number: :asc) }

  def self.unallocated
    joins("LEFT OUTER JOIN cte_allocations ON cte_allocations.rodo_cte_id = rodo_ctes.id")
    .group("rodo_ctes.id")
    .having("sum(cte_allocations.weight) IS NULL OR sum(cte_allocations.weight) < rodo_ctes.weight")
  end

  def self.import(file)
    spreadsheet = Roo::Excel.new(file.path, nil, :ignore)
    header = spreadsheet.row(1)

    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]

      # cleaning data
      rodo_cte_params = {}
      rodo_cte_params[:number] = row['CTE']
      rodo_cte_params[:series] = row['SERIE']
      rodo_cte_params[:weight] = row['PESO']
      rodo_cte_params[:amount] = row['FRETE']
      rodo_cte_params[:emitted_at] = "#{row['DATA']} -03:00"
      rodo_cte_params[:cnpj] = row['CNPJ'].delete('/').delete('.').delete('-')

      RodoCte.create(rodo_cte_params)
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
