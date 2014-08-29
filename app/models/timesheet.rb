class Timesheet < ActiveRecord::Base
  attr_accessible :approved, :employee_id, :project_id, :workdate, :workend, :workstart
  belongs_to :employee
  belongs_to :project  
  validates :employee_id, :project_id, presence: true
  validates :duration, numericality: {greater_than: 0 }

  def duration
    workend-workstart
  end 
  
  def duration_in_hrs
    duration.to_i/3600
  end 



end
