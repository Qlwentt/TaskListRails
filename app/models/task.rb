class Task < ActiveRecord::Base
	attr_accessor 

	def completed?
		completed_at == nil ? false : true
	end

	def self.uncompleted_tasks
		#returns an array of the uncompleted tasks
		uncompleted_tasks=Task.where(completed_at: nil)
		uncompleted_tasks.empty? == true ? [] : uncompleted_tasks
	end
end
