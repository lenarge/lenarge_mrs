class CteAllocator

  def self.allocate_all
    # Allocating Rodo Ctes in Ferro Ctes using scope unallocated
    RodoCte.unallocated.each do |rodo_cte|
      Rails.logger.debug "starting allocation of RodoCte #{rodo_cte.number} with weight #{rodo_cte.weight}"

      FerroCte.unallocated.each do |ferro_cte|

        rodo_balance = rodo_cte.weight_balance
        ferro_balance = ferro_cte.weight_balance
        allocated_weight = (rodo_balance <= ferro_balance) ? rodo_balance : ferro_balance

        Rails.logger.debug "  allocating to FerroCte #{ferro_cte.number} with weight balances: R -> #{rodo_balance} and F -> #{ferro_balance}"

        if allocated_weight > 0
          CteAllocation.create(ferro_cte: ferro_cte, rodo_cte: rodo_cte, weight: allocated_weight)
        else
          # stop to iterate Ferro Ctes when Rodo Cte weight is balanced
          break
        end
      end
    end
  end
end
