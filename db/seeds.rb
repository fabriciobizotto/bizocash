# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.find_by(email: 'fabricio.bizotto@gmail.com')

if user
    contas = ['BB', 'NU', 'DINHEIRO', 'CEF' 'SICOOB']
    contas_i = ['Easynvest', 'XP', 'Binance']

    contas.each do |conta|
        Account.find_or_create_by!(name: conta, active: true, investment: false, user:user)
    end

    contas_i.each do |conta|
        Account.find_or_create_by!(name: conta, active: true, investment: true, user:user)
    end

end