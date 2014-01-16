
# ActionMailer::Base.smtp_settings = {
#   :address                => 'smtp.gmail.com',
#   :port                   => 587,
#   :domain                 => 'gmail.com',
#   :user_name              => 'ratna.v143@gmail.com',
#   :password               => 'your password',
#   :authentication         => 'plain',
#   :enable_starttls_auto   => true
# }

# ActionMailer::Base.smtp_settings = {
#   :address        => 'smtp.sendgrid.net',
#   :port           => '587',
#   :authentication => :plain,
#   :user_name      => "app20177861@heroku.com",
#   :password       => "47vmbjfc",
#   :domain         => 'heroku.com',
#   :enable_starttls_auto => true
# }


ActionMailer::Base.smtp_settings  = {
		address: "smtp.mandrillapp.com",
		port: 587,
		authentication: "plain",
		enable_starttls_auto: true,
		user_name: "pramodv_nyros@yahoo.com",
		password: "GugTy1S8VGRI-9sioVt4Sg"
	}


