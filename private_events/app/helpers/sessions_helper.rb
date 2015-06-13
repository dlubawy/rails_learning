module SessionsHelper
  def sign_in(user)
    remember_token = User.new_remember_token
    cookies.permanent[:token_digest] = remember_token
    user.update_attribute(:token_digest, User.digest(remember_token))
    self.current_user = user
  end

  def current_user=(user)
    @current_user = user
  end

  def current_user
    remember_token = User.digest(cookies[:token_digest])
    @current_user ||= User.find_by(token_digest: remember_token)
  end

  def sign_out
    current_user.update_attribute(:token_digest,
                                  User.digest(User.new_remember_token))
    cookies.delete(:token_digest)
    self.current_user = nil
  end

  def signed_in?
    !!current_user
  end
end
