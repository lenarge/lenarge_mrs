class MrsExportReport

  def initialize(params)
    @start_date = params[:start_date]
    @end_date = params[:end_date]
  end

  def to_text
    txt = ''

    RodoCte.where(emitted_at: @start_date..@end_date).each do |rodo_cte|
      txt << '10' # Fixo para a linha de RodoCte
      txt << sprintf("%014d", rodo_cte.cnpj) # Cnpj do Emissor
      txt << sprintf("%08d", rodo_cte.number) # Número do Cte
      txt << rodo_cte.series.rjust(2, '0') # Série do Cte
      txt << ' '
      txt << rodo_cte.emitted_at.strftime('%d%m%Y') # Data de emissão
      txt << sprintf("%015.2f", rodo_cte.amount).sub('.', ',') # Valor do Cte
      txt << sprintf("%013.2f", 0).sub('.', ',') # Iss do Cte
      txt << sprintf("%010.2f", 0).sub('.', ',') # Icms do Cte
      txt << "\r\n"

      rodo_cte.cte_allocations.each do |allocation|
        txt << '20'
        txt << sprintf("%014d", rodo_cte.cnpj) # Cnpj do Emissor
        txt << sprintf("%08d", rodo_cte.number) # Número do Cte
        txt << rodo_cte.series.rjust(2, '0') # Série do Cte

        txt << ' 31  '

        txt << sprintf("%06d", allocation.ferro_cte.number) # Número do Ferro Cte
        txt << '25011'
        txt << sprintf("%010.2f", (allocation.weight/1000).round(2)).sub('.', ',') # Peso alocado
        txt << "\r\n"
      end
    end

    txt
  end
end
