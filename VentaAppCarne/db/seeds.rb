# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'


productos = CSV.read(Rails.root.join("lib/assets/seed/productos.csv"), :headers=>true, :col_sep => ";")
clientes = CSV.read(Rails.root.join("lib/assets/seed/clientes.csv"), :headers=>true, :col_sep => ";")

Admin.create!(
  email: 'culloa@arauco.cl',
  password: '123456',
  password_confirmation: '123456'
)

[
  'Vendido',
  'Entregado',
  'Pagado'
].each do |s|
  State.create!(
    name: s
  )
end

clientes.each do |c|
  # puts c['CLIENTE']
  client = Client.create!(
    name: c['CLIENTE'],
    phone: "88888888",
    name_phone: c['CLIENTE']
  )

  direction = Direction.create!(
    sector: c['SECTOR'],
    street: c['DIRECCION'],
    client_id: client.id
  )
end
puts productos
productos.each do |p|
  puts p['NOMBRE']
  product = Product.create!(
    name: p['NOMBRE'],
    unit_price: p['UNIT PRICE'],
    unit_metric: p['UNIT METRIC'],
    supp_price: p['SUPP PRICE'],
    estimated_weight: p['EST WEIGHT']
  )
end

# Client.all.each do |c|
#   num_sales = rand(1..3)
#   num_states = State.all.length
#   puts "Estados: #{num_states}"
#   num_sales.times do
#     s = Sale.create!(
#       client_id: c.id,
#       paid: 0
#     )
#     products_list = Product.all.sample(1 + rand(Product.all.count))
#     products_list.each do |p|
#       SaleProduct.create!(
#         sale_id: s.id,
#         cantidad: rand(1..3),
#         real_weight: rand((p.estimated_weight * 0.75)..(p.estimated_weight * 1.25)),
#         product_id: p.id
#       )
#     end
#     for i in 1..rand(1..num_states)
#       puts "State: #{i}"
#       s.states << State.find(i)
#       day = rand(((i - 1) * 5 + 1)..((i * 5)))
#       time = "2020-07-#{day}"
#       st = s.sale_states.find_by(state_id: i)
#       puts time
#       st.updated_at = time
#       puts st.updated_at
#       st.save(touch: false)
#       puts st.updated_at
#     end
#     if s.sale_states.max_by {|state| state.state_id}.state_id == 2 and rand(1..9) < 4
#       s.update(paid: rand(1..s.total))
#     elsif s.sale_states.max_by {|state| state.state_id}.state_id == 3
#       s.update(paid: s.total)
#     end
#   end
# end

Search.create!(
  client_id: nil,
  updated_open: nil,
  updated_close: nil,
  products: nil
)
