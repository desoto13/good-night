user_list = ['Juan de la Cruz', 'John Doe', 'Pedro Penduko', 'Maria Clara de los Santos', 'Crisostomo Ibarra', 'Simoun Pedro']

user_list.each do |user_name|
  User.create(name: user_name)
end
