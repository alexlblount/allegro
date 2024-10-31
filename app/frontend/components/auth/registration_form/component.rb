# app/frontend/components/auth/registration_form/component.rb
# frozen_string_literal: true

module Auth
  class RegistrationForm::Component < ApplicationViewComponent
    include ViewComponentContrib::StyleVariants

    style :container do
      base do
        %w[
          flex min-h-full flex-col justify-center px-6 py-12 lg:px-8
        ]
      end
    end

    style :header do
      base do
        %w[
          sm:mx-auto sm:w-full sm:max-w-sm
        ]
      end
    end

    style :heading do
      base do
        %w[
          mt-10 text-center text-2xl font-bold leading-9 tracking-tight text-gray-900
        ]
      end
    end

    style :form_container do
      base do
        %w[
          mt-10 sm:mx-auto sm:w-full sm:max-w-sm
        ]
      end
    end

    style :form do
      base do
        %w[
          space-y-6
        ]
      end
    end

    style :field_group do
      base do
        %w[
          grid grid-cols-1 gap-4 sm:grid-cols-2
        ]
      end
    end

    style :footer do
      base do
        %w[
          mt-10 text-center text-sm text-gray-500
        ]
      end
    end

    style :footer_link do
      base do
        %w[
          font-semibold leading-6 text-indigo-600 hover:text-indigo-500
        ]
      end
    end

    def call
      tag.div class: style(:container) do
        safe_join(
          [
            render_header,
            render_form_container
          ]
        )
      end
    end

    private

    def render_header
      tag.div class: style(:header) do
        safe_join(
          [
            # tag.img(
            #   class: "mx-auto h-10 w-auto",
            #   src: vite_asset_path("images/logo.svg"),
            #   alt: "Your Company"
            # ),
            tag.h2(
              'Create your account',
              class: style(:heading)
            )
          ]
        )
      end
    end

    def render_form_container
      tag.div class: style(:form_container) do
        safe_join(
          [
            render_form,
            render_footer
          ]
        )
      end
    end

    def render_form
      form_for(
        resource,
        as: resource_name,
        url: helpers.send(:registration_path, resource_name),
        html: { class: style(:form) }
      ) do |f|
        safe_join(
          [
            render_profile_fields(f),
            render_account_fields(f),
            render_password_fields(f),
            render(Button::Component.new) { 'Sign up' }
          ]
        )
      end
    end

    def render_profile_fields(form)
      form.fields_for :profile do |profile_form|
        tag.div class: style(:field_group) do
          safe_join(
            [
              render(
                FormField::Component.new(
                  form: profile_form,
                  attribute: :first_name,
                  required: true
                )
              ),
              render(
                FormField::Component.new(
                  form: profile_form,
                  attribute: :last_name,
                  required: true
                )
              )
            ]
          )
        end
      end
    end

    def render_account_fields(form)
      render(
        FormField::Component.new(
          form:,
          attribute: :email,
          type: 'email',
          required: true,
          autocomplete: 'email'
        )
      )
    end

    def render_password_fields(form)
      safe_join(
        [
          render(
            FormField::Component.new(
              form:,
              attribute: :password,
              type: 'password',
              required: true,
              helper_text: password_helper_text
            )
          ),
          render(
            FormField::Component.new(
              form:,
              attribute: :password_confirmation,
              type: 'password',
              required: true,
              label: 'Confirm password'
            )
          )
        ]
      )
    end

    def render_footer
      tag.p class: style(:footer) do
        safe_join(
          [
            'Already have an account? ',
            link_to(
              'Sign in',
              helpers.send(:new_session_path, resource_name),
              class: style(:footer_link)
            )
          ]
        )
      end
    end

    def password_helper_text
      min_length = User.password_length.min
      "#{min_length} characters minimum"
    end

    delegate :resource,
      :resource_name,
      :devise_mapping,
      to: :helpers
  end
end
