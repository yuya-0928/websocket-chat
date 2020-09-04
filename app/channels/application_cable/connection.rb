module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user
    identified_by :current_talent

    def connect
      session_key = cookies.encrypted[Rails.application.config.session_options[:key]]
      if session_key['warden.user.user.key'].nil?
        self.current_talent = find_verified_talent
      else
        self.current_user = find_verified_user
      end
    end

    private

      def find_verified_user
        # verified_user = User.find_by(id: env['warden'].user.id)
        # return reject_unauthorized_connection unless verified_user
        # verified_user
        session_key = cookies.encrypted[Rails.application.config.session_options[:key]]
        verified_id = session_key['warden.user.user.key'][0][0]
        verified_user = User.find_by(id: verified_id)
      end

      def find_verified_talent
        session_key = cookies.encrypted[Rails.application.config.session_options[:key]]
        verified_id = session_key['warden.user.talent.key'][0][0]
        verified_user = Talent.find_by(id: verified_id)
      end
  end
end
