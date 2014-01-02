class User < ActiveRecord::Base

  has_one :splash_screen

  has_one :profile

  acts_as_messageable

  def name
    email
  end

  accepts_nested_attributes_for :profile

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :token_authenticatable

  attr_accessible :username, :email, :password, :password_confirmation, :profile_attributes

  validates :email, :email => true
  validates :username, :presence =>  true, :uniqueness => true


  has_many :relationships, foreign_key: "follower_id", dependent: :destroy, :autosave => true

  has_many :followed_users, through: :relationships, source: :followed, :autosave => true

  has_many :reverse_relationships, foreign_key: "followed_id",class_name: "Relationship", dependent: :destroy, :autosave => true
  has_many :followers, through: :reverse_relationships, source: :follower, :autosave => true

  has_many :likes

  #def likes(other_post)
  #  likes.find_by(post_id: )
  #end

  def following?(other_user)
    relationships.find_by(followed_id: other_user.id)
  end

  def follow!(other_user)
    relationships.create!(followed_id: other_user.id)
  end

  def unfollow!(other_user)
    relationships.find_by(followed_id: other_user.id).destroy!
  end

  accepts_nested_attributes_for :relationships

  attr_accessible :relationships_attributes, :followed_id

  has_many :authentications

  def self.new_with_session(params,session)
    if session["devise.user_attributes"]
      new(session["devise.user_attributes"],without_protection: true) do |user|
        user.attributes = params
        user.valid?
      end
    else
      super
    end
  end


  def self.from_omniauth(auth, current_user)
    authentication = Authentication.where(:provider => auth.provider, :uid => auth.uid.to_s, :token => auth.credentials.token, :secret => auth.credentials.secret).first_or_initialize
    if authentication.user.blank?
      user = current_user.nil? ? User.where('email = ?', auth["info"]["email"]).first : current_user
      if user.blank?
        user = User.new
        user.password = Devise.friendly_token[0,10]
        #user.username = auth.info.name
        user.email = auth.info.email
        auth.provider == "twitter" ?  user.save(:validate => false) :  user.save
      end
      authentication.username = auth.info.nickname
      authentication.user_id = user.id
      authentication.save
    end
    authentication.user
  end

end
