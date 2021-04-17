module DeliverablesHelper
    def add_members(members, deliverable_id)
        members.each do |member|
            if params[member.id.to_s]
              Assignment.create!(user_id: member.id, deliverable_id: deliverable_id)
             
              @deliverable = Deliverable.find_by_id deliverable_id
              @project = Project.find_by_id @deliverable.project_id
              @group = Group.find_by_id @project.group_id
              group_id = @group.id
              @deliverable.create_activity :assign, owner: member, group: group_id
            end
        end
    end
end
