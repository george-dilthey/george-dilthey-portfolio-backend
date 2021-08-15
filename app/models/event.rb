class Event < ApplicationRecord
    has_many :commits

    def self.get_events
        url = 'https://api.github.com/users/george-dilthey/events/public'
        response = HTTParty.get(url)
        result = response.parsed_response
        result.each {|e| create_from_api(e)}
        
    end

    def self.create_from_api(event)
        new_event = find_or_create_by(id: event["id"]) do |e|
            e.id = event["id"]
            e.type = event["type"]
            e.repo_id = event["repo"]["id"]
            e.timestamp = event["created_at"]
        end 
    end
    
end
