class Member < ApplicationRecord

  has_many :announcements
  has_many :comments
  has_one :profile_member

  accepts_nested_attributes_for :profile_member

  validate :nested_attributes
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  private

  def nested_attributes
    if nested_attributes_blank?
      errors.add(:base, "First name and date of birth cannot be in bank")
    end
  end

  def nested_attributes_blank?
    profile_member.first_name.blank? || profile_member.birthdate.blank?
  end
end
