class Email

	def self.send_simple_message(to, link)
	  RestClient.post "https://api:key-3ax6xnjp29jd6fds4gc373sgvjxteol0"\
	  "@api.mailgun.net/v2/samples.mailgun.org/messages",
	  :from => "Excited User <me@samples.mailgun.org>",
	  :to => to,
	  :subject => "Reset Password",
	  :text => "Follow the link: localhost:9292/users/password_reset/#{link}"
	end

end