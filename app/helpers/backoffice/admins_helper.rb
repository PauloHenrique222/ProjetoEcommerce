module Backoffice::AdminsHelper

  OptionsForRoles = Struct.new(:id, :description)

  def options_for_roles
    Admin.roles.map do |key, value|
      if(value == 0)
        label = 'full access'
      else
        label = 'restricted access'
      end
      (OptionsForRoles.new(key, label))
    end
  end
end
