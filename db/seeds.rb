@user = User.create(email: "test@test.com", password: "password", password_confirmation: "password", first_name: "Ron", last_name: "Swanson")

puts "1 User created"

100.times do |post|
  Post.create!(date: Date.today, rationale: "#{post} rationale content", user_id: @user.id)
end

puts "100 Posts have been created"