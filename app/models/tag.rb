class Tag < ApplicationRecord
	has_many :job_tags
	has_many :jobs, through: :job_tags
	validates :title, presence: true, uniqueness: true
	
	def total_jobs
		self.jobs.count
	end
	
	def avg_sal
		self.jobs.average(:salary)
	end
end
