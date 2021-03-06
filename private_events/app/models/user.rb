class User < ActiveRecord::Base
  has_many :created_events, :class_name => "Event",
    foreign_key: :creator_id
  has_many :attended_events, :through => :invites
  has_many :invites, foreign_key: :attendee_id

  before_create :create_remember_token

  validates :name, presence: true, length: {maximum: 20}

  def attending?(event)
    event.attendees.include?(self)
  end

  def attend!(event)
    self.invites.create!(attended_event_id: event.id)
  end

  def cancel!(event)
    self.invites.find_by(attended_event_id: event.id).destroy
  end

  def upcoming_events
    self.attended_events.upcoming
  end

  def previous_events
    self.attended_events.past
  end

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.digest(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private

  def create_remember_token
    self.token_digest = User.digest(User.new_remember_token)
  end
end
