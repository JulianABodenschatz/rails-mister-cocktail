class Ingredient < ApplicationRecord
  before_destroy :check_doses

  has_many :doses
  has_many :cocktails, through: :doses
  validates :name, presence: true, uniqueness: true

  def check_doses
    if self.doses.count > 0
      raise ActiveRecord::InvalidForeignKey
    end
  end
end
