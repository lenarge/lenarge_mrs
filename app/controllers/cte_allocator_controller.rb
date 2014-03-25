class CteAllocatorController < ApplicationController
  def allocate
    CteAllocator.allocate_all

    redirect_to root_path, notice: "Todos os Cte's foram alocados com sucesso"
  end
end
