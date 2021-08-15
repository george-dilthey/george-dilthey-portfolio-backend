class Commit < ApplicationRecord
  belongs_to :event

  def self.get_commit(url)
    response = HTTParty.get(url)
    result = response.parsed_response  
  end
  
  def self.create_from_event(event)
    if event["type"] == "PushEvent"
      event["payload"]["commits"].each do |c|
        commit = get_commit(c["url"])
        new_commit = find_or_create_by(sha: commit["sha"]) do |p|
          p.sha = commit["sha"]
          p.url = commit["url"]
          p.message = commit["commit"]["message"]
          p.stats = commit["stats"]["total"]
          p.event = Event.find_by_id(event["id"])
        end
      end
    end
  end
end
