class Event < ApplicationRecord
    has_many :commits
    self.inheritance_column = nil

    def self.get_events
        url = 'https://api.github.com/users/george-dilthey/events/public'
        response = HTTParty.get(url)
        result = response.parsed_response 
    end

    def self.create_from_api
        get_events.each do |event|
            new_event = find_or_create_by(id: event["id"]) do |e|
                e.id = event["id"]
                e.type = event["type"]
                e.repo_id = event["repo"]["id"]
                e.timestamp = event["created_at"]
            end 
        end    
    end

end
