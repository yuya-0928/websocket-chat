class Message < ApplicationRecord
    validates :content, presence: true
    after_create_commit { MessageBroadcastJob.perform_later self }

    belongs_to :user, optional: true
    belongs_to :talent, optional: true
    belongs_to :room
end
