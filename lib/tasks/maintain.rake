namespace :maintain do
  desc 'Remove company via name'
  task :remove_company_via_name, [:company_name] => :environment do |_t, args|
    company_name = args.company_name
    raise 'Must input company name!' if company_name.nil?

    company = Company.find_by name: company_name
    company.users.each do |user|
      puts "Deleting #{user.id}: #{user.name}"
      user.destroy
    end
    puts "Deleting company #{company.id}: #{company.name}"
    company.destroy
  end
end
