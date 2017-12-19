class Event < ApplicationRecord
def single_day_event?
	starts_at.to_date == ends_at.to_date
end

def as_json(*)
	super.except("created_at", "updated_at").tap do |hash|
		hash["is_single_day_event"] = single_day_event?
	end
end

end

