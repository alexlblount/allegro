# app/frontend/components/auth/login_form/component.rb
# frozen_string_literal: true

module Auth
  class LoginForm::Component < ApplicationViewComponent
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
            # We'll use a logo component in the future if needed
            # tag.img(
            #   class: "mx-auto h-10 w-auto",
            #   src: vite_asset_path("images/logo.svg"),
            #   alt: "Your Company"
            # ),
            tag.h2(
              'Sign in to your account',
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
        url: helpers.send(:session_path, resource_name),
        html: { class: style(:form) }
      ) do |f|
        safe_join(
          [
            render(
              FormField::Component.new(
                form: f,
                attribute: :email,
                type: 'email',
                required: true,
                autocomplete: 'email'
              )
            ),
            render_password_field(f),
            render(Button::Component.new) { 'Sign in' }
          ]
        )
      end
    end

    def render_password_field(form)
      tag.div do
        render(
          FormField::Component.new(
            form:,
            attribute: :password,
            type: 'password',
            required: true,
            autocomplete: 'current-password'
          )
        ) do |field|
          # Add the "Forgot password?" link to the label
          tag.div class: 'flex items-center justify-between' do
            safe_join(
              [
                field.label,
                tag.div(class: 'text-sm') do
                  link_to 'Forgot password?', # rubocop:disable I18n/RailsI18n/DecorateString
                    helpers.send(:new_password_path, resource_name),
                    class: style(:footer_link)
                end
              ]
            )
          end
        end
      end
    end

    def render_footer
      tag.p class: style(:footer) do
        safe_join(
          [
            'Not a member? ',
            link_to(
              'Sign up now',
              helpers.send(:new_registration_path, resource_name),
              class: style(:footer_link)
            )
          ]
        )
      end
    end

    delegate :resource,
      :resource_name,
      :devise_mapping,
      to: :helpers
  end
end
