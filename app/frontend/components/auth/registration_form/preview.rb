# app/frontend/components/auth/registration_form/preview.rb
# frozen_string_literal: true

module Auth
  class RegistrationForm::Preview < ApplicationViewComponentPreview
    self.container_class = 'h-full bg-white'

    def default
      # Mock the helper methods that would normally come from Devise
      user = User.new
      user.build_profile

      allow(helpers).to receive(:resource).and_return(user)
      allow(helpers).to receive(:resource_name).and_return(:user)
      allow(helpers).to receive(:devise_mapping).and_return(Devise.mappings[:user])

      # Render the component
      render_component
    end

    def with_errors
      user = User.new
      user.build_profile
      user.validate # This will add errors to the model

      allow(helpers).to receive(:resource).and_return(user)
      allow(helpers).to receive(:resource_name).and_return(:user)
      allow(helpers).to receive(:devise_mapping).and_return(Devise.mappings[:user])

      render_component
    end
  end
end
