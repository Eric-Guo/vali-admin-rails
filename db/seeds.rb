companies = Company.create((1..20).collect do
  {
    name: FFaker::CompanyCN.name,
    city: FFaker::Address.city,
    address: FFaker::Address.street_address
  }
end)

vertical_market_ids = VerticalMarket.pluck(:id)

companies.each do |company|
  user = User.create!(
    name: FFaker::NameCN.name,
    title: FFaker::JobCN.title,
    email: FFaker::Internet.email,
    password: '123456',
    password_confirmation: '123456',
    phone: FFaker::PhoneNumber.phone_number,
    confirmed_at: Time.zone.now
  )
  CompanyUser.create(company: company, user: user)
  VerticalMarketCompany.create(company: company, vertical_market_id: vertical_market_ids.sample)
end
