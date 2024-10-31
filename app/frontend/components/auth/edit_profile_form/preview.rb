# app/frontend/components/auth/edit_profile_form/preview.rb
# frozen_string_literal: true

module Auth
  class EditProfileForm::Preview < ApplicationViewComponentPreview
    self.container_class = 'h-full bg-white'

    def default
      user = User.new(email: 'user@example.com')
      user.build_profile(
        first_name: 'John',
        last_name: 'Doe'
      )

      allow(helpers).to receive(:resource).and_return(user)
      allow(helpers).to receive(:resource_name).and_return(:user)
      allow(helpers).to receive(:devise_mapping).and_return(Devise.mappings[:user])

      render_component
    end

    def with_pending_confirmation
      user = User.new(
        email: 'user@example.com',
        unconfirmed_email: 'new@example.com'
      )
      user.build_profile(
        first_name: 'John',
        last_name: 'Doe'
      )

      allow(user).to receive(:pending_reconfirmation?).and_return(true)
      allow(helpers).to receive(:resource).and_return(user)
      allow(helpers).to receive(:resource_name).and_return(:user)
      allow(helpers).to receive(:devise_mapping).and_return(Devise.mappings[:user])

      render_component
    end
  end
end
