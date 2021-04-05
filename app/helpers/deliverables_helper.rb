module DeliverablesHelper
    def add_members(members, deliverable_id)
        members.each do |member|
            if params[member.id.to_s]
              Assignment.create!(user_id: member.id, deliverable_id: deliverable_id)
            end
        end
    end
end
