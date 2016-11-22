class Todo < ApplicationRecord
  belongs_to :user

  scope :todo, -> {where(status: "todo")}
  scope :progress, -> {where(status: "progress")}
  scope :done, -> {where(status: "done")}

  validates :status, :title, :description, presence: true
  validate :status_must_be_one_of_valid_ooptions

  def status_must_be_one_of_valid_ooptions
    options = ["done", "progress", "todo"]
    if status.present? && options.exclude?(status)
      errors.add(:status, "status must be either todo, progress, or done")
    end
  end
end
