class Event < ApplicationRecord
    has_many :commits

    def event_from_api
        url = 'https://api.github.com/users/george-dilthey/events/public'
    end
end
