get '/users/new' do
	@user = User.new
	erb :"users/new"
end

post '/users' do
	@user = User.create(:email=> params[:email],
				:password => params[:password],
				:password_confirmation => params[:password_confirmation])
	if @user.save
		session[:user_id] = @user.id
		redirect to('/')

	else

		flash.now[:errors] = @user.errors.full_messages
		erb :"users/new"

	end
end

get '/users/forgot_password' do
	erb :"users/forgot_password"
end

post '/users/forgot_password' do
	@email = params[:email]
	user = User.first(:email =>@email)
	if user
		user.password_token = (1..64).map{('A'..'Z').to_a.sample}.join
		user.save
		erb :"users/sent_token"
	else
		flash.now[:notice]= "The email address is incorrect, please try again"
		erb :"users/forgot_password"
	end
end

get '/users/password_reset/:token' do
  @token = params[:token]
  user = User.first(:password_token=> @token)
  if user
  	erb :"users/password_reset"
  else
  	"Invalid link"
  end
end

post '/users/password_reset' do
	 user = User.first(:password_token=> params[:password_token])
	 user.update(:password=> params[:password],
	 			 :password_confirmation=> params[:password_confirmation],
	 			 :password_token => nil)
	redirect('/sessions/new')
end