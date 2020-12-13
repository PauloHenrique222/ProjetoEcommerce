class Admin < ApplicationRecord

  enum role: {full_access: 0, restricted_access: 1}
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def role_br
    if self.role == 'full_access'
      'Acesso Completo'
    else
      'Acesso Restrito'
    end
  end

  scope :with_full_access, lambda{ where(role: 0)}
  scope :with_restricted_access, lambda{ where(role: 1)}
end
