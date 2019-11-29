module SignUpHelper
  def fill_user_data(user)
    fill_in 'Name', with: user.name
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    fill_in 'Password confirmation', with: user.password
    fill_in 'Gender', with: user.gender
    fill_in 'Age', with: user.age
  end
end
