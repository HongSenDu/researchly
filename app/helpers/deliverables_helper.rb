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

              DeliverableMailer.deliverable_assign(member, @deliverable).deliver! 
            end
        end
    end

    def mail_deliverable_complete(user, deliverable, status)
        if deliverable.status == "Ongoing" && status == "Complete"
            DeliverableMailer.deliverable_complete(user, deliverable).deliver! 
        end
    end
end
