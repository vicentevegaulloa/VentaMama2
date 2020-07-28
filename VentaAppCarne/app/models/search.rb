class Search < ApplicationRecord
  def sales
    @sales ||= find_sales
  end

  private

  def find_sales
    sales = Sale.order(:client_id)
    sales = sales.where(client_id: client_id) if client_id.present?
    sales
  end
end
