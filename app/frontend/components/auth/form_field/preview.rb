# app/frontend/components/auth/form_field/preview.rb
# frozen_string_literal: true

module Auth
  class FormField::Preview < ApplicationViewComponentPreview
    self.container_class = 'max-w-sm p-4 bg-white'

    class PreviewUser
      include ActiveModel::Model
      attr_accessor :email, :password

      validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
      validates :password, presence: true, length: { minimum: 8 }
    end

    def default
      form = form_with(model: PreviewUser.new, url: '#')
      render_component(form:, attribute: :email, type: 'email', required: true)
    end

    def with_error
      user = PreviewUser.new
      user.validate
      form = form_with(model: user, url: '#')
      render_component(form:, attribute: :email, type: 'email', required: true)
    end

    def password_field
      form = form_with(model: PreviewUser.new, url: '#')
      render_component(
        form:,
        attribute: :password,
        type: 'password',
        required: true,
        autocomplete: 'current-password'
      )
    end

    def with_helper_text
      form = form_with(model: PreviewUser.new, url: '#')
      render_component(
        form:,
        attribute: :password,
        type: 'password',
        required: true,
        helper_text: 'At least 8 characters'
      )
    end
  end
end
