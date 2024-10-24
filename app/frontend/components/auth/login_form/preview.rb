# app/frontend/components/auth/login_form/preview.rb
# frozen_string_literal: true

module Auth
  class LoginForm::Preview < ApplicationViewComponentPreview
    self.container_class = 'h-full bg-white'

    def default
      # Mock the helper methods that would normally come from Devise
      allow(helpers).to receive(:resource).and_return(User.new)
      allow(helpers).to receive(:resource_name).and_return(:user)
      allow(helpers).to receive(:devise_mapping).and_return(Devise.mappings[:user])

      # Render the component
      render_component
    end
  end
end
