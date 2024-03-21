class Task < ApplicationRecord
    validates :title, :start_date, :end_date, presence: true
    validates :memo, length: {maximum: 500}
    validates :title, length: {maximum: 20} 
    validate :start_end_check

    def start_end_check
        if self.start_date && self.end_date
            errors.add(:end_date, "must be after start date") unless
            self.start_date <= self.end_date 
        end
    end
end
