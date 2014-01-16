
ActionMailer::Base.smtp_settings = {
  :address                => 'smtp.gmail.com',
  :port                   => 587,
  :domain                 => 'gmail.com',
  :user_name              => 'ratna.v143@gmail.com',
  :password               => 'your password',
  :authentication         => 'plain',
  :enable_starttls_auto   => true
}

