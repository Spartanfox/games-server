json.extract! highscore, :id, :name, :time, :score, :level_id, :created_at, :updated_at
json.url highscore_url(highscore, format: :json)
