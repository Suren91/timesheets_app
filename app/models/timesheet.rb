class Timesheet < ActiveRecord::Base
  attr_accessible :approved, :employee_id, :project_id, :workdate, :workend, :workstart
  belongs_to :employee
  belongs_to :project  
  validates :employee_id, :project_id, presence: true
  validates :duration, numericality: {greater_than: 0 }
  validate :validate_dates

  def duration
    workend-workstart
  end 
  
  def duration_in_hrs
    duration.to_i/3600
  end 
  
  def validate_dates
     if self.workdate > Date.today
	   errors.add(:workdate, "Work date cannot be in future")
	 end 
  end 



end
