# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
puts 'Installing permissions...'
permissions = {}
models = %w(Role User )
base_actions = %w(read create update destroy)
models.each { |model| permissions[model] = base_actions }
puts "  Deleting pevious permissions..."
Admin::Permission.delete_all
puts "  Creating new permissions..."
permissions.each_pair do |subject, actions|
  actions.each do |action|
    permission = Admin::Permission.create(subject: subject, action: action)
    puts "    #{permission.code}"
  end
end
