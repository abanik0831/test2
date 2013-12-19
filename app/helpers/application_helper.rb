module ApplicationHelper
  def title(page_title)
    content_for(:title) {
      page_title
    }
  end
  def helper
    @crntuserg = Profile.where("profiles.id" => current_user.id).first
    @profilesg = Profile.find(params[:id])
    @relationshipsg = @profilesg.relationships.build(followed_id: @profilesg.id)
  end

  def current_user?(user)
    user == current_user
  end

    def broadcast(channel, &block)
      message = {:channel => channel, :data => capture(&block)}
      uri = URI.parse("http://fayeredis.herokuapp.com/faye")
      Net::HTTP.post_form(uri, :message => message.to_json)
    end

end
