AdminUser.create(email: "admin@user.com", 
                 password: "password", 
                 password_confirmation: "password", 
                 first_name: "Admin", 
                 last_name: "User",
                 phone: "5134523819")

puts "1 AdminUser created"

@user = User.create(email: "test@test.com", 
                    password: "password", 
                    password_confirmation: "password", 
                    first_name: "Ron", 
                    last_name: "Swanson",
                    phone: "5134523819")

puts "1 User created"

100.times do |post|
  Post.create!(date: Date.today, rationale: "#{post} rationale content", user_id: @user.id, overtime_request: 2.5)
end

puts "100 Posts have been created"

100.times do |audit_log|
  AuditLog.create!(user_id: User.last.id, status: 0, start_date: (Date.today - 6.days))
end

puts "100 AuditLogs have been created"