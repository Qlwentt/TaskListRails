class Task < ActiveRecord::Base
 	belongs_to :user

	def completed?
		completed_at == nil ? false : true
	end

	def self.uncompleted_tasks(user_id)
		#returns an array of the uncompleted tasks
		uncompleted_tasks=Task.where(completed_at: nil).where(user_id: user_id)
		uncompleted_tasks.empty? == true ? [] : uncompleted_tasks
	end
end
