User.delete_all
User.create!(name: 'sample', email: 'sample@example.com',
            password: 'password', password_confirmation: 'password',
            bio: "#{"自己紹介です。" * 10}")

backend = Category.create!(name: "バックエンド")
frontend = Category.create!(name: "フロントエンド")
infra = Category.create!(name: "インフラ")

# 先々月のデータ
Item.create!(name: "Ruby on Rails", learning_time: 30, category_id: backend.id, user_id: User.first.id, created_at: Time.current.months_ago(2))
Item.create!(name: "JavaScript", learning_time: 20, category_id: frontend.id, user_id: User.first.id, created_at: Time.current.months_ago(2))
Item.create!(name: "AWS", learning_time: 10, category_id: infra.id, user_id: User.first.id, created_at: Time.current.months_ago(2))

# 先月のデータ
Item.create!(name: "Ruby on Rails", learning_time: 50, category_id: backend.id, user_id: User.first.id, created_at: Time.current.months_ago(1))
Item.create!(name: "JavaScript", learning_time: 40, category_id: frontend.id, user_id: User.first.id, created_at: Time.current.months_ago(1))
Item.create!(name: "AWS", learning_time: 30, category_id: infra.id, user_id: User.first.id, created_at: Time.current.months_ago(1))

# 今月のデータ
Item.create!(name: "Ruby on Rails", learning_time: 70, category_id: backend.id, user_id: User.first.id)
Item.create!(name: "JavaScript", learning_time: 60, category_id: frontend.id, user_id: User.first.id)
Item.create!(name: "AWS", learning_time: 50, category_id: infra.id, user_id: User.first.id)