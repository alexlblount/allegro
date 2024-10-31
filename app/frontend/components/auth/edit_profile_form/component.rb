# app/frontend/components/auth/edit_profile_form/component.rb
# frozen_string_literal: true

module Auth
  class EditProfileForm::Component < ApplicationViewComponent
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

    style :section do
      base do
        %w[
          space-y-6 border-b border-gray-200 pb-6 pt-4
        ]
      end
    end

    style :section_heading do
      base do
        %w[
          text-lg font-medium leading-6 text-gray-900
        ]
      end
    end

    style :danger_section do
      base do
        %w[
          mt-10 space-y-4 divide-y divide-gray-200
        ]
      end
    end

    style :danger_zone do
      base do
        %w[
          pt-4
        ]
      end
    end

    style :danger_button do
      base do
        %w[
          rounded-md
          bg-red-600
          px-3
          py-2
          text-sm
          font-semibold
          text-white
          shadow-sm
          hover:bg-red-500
          focus-visible:outline
          focus-visible:outline-2
          focus-visible:outline-offset-2
          focus-visible:outline-red-600
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
        tag.h2(
          'Edit Profile',
          class: style(:heading)
        )
      end
    end

    def render_form_container
      tag.div class: style(:form_container) do
        safe_join(
          [
            render_form,
            render_danger_zone,
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
        html: { method: :put, class: style(:form) }
      ) do |f|
        safe_join(
          [
            render_profile_section(f),
            render_account_section(f),
            render_password_section(f),
            render_confirmation_section(f),
            render(Button::Component.new) { 'Update' }
          ]
        )
      end
    end

    def render_profile_section(form)
      tag.div class: style(:section) do
        safe_join(
          [
            tag.h3('Profile Information', class: style(:section_heading)),
            (form.fields_for :profile do |profile_form|
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
            end)
          ]
        )
      end
    end

    def render_account_section(form)
      tag.div class: style(:section) do
        safe_join(
          [
            tag.h3('Account Settings', class: style(:section_heading)),
            render(
              FormField::Component.new(
                form:,
                attribute: :email,
                type: 'email',
                required: true,
                autocomplete: 'email'
              )
            ),
            render_email_confirmation_notice
          ]
        )
      end
    end

    def render_password_section(form)
      tag.div class: style(:section) do
        safe_join(
          [
            tag.h3('Change Password', class: style(:section_heading)),
            tag.p(class: 'text-sm text-gray-500') do
              "Leave blank if you don't want to change it"
            end,
            render(
              FormField::Component.new(
                form:,
                attribute: :password,
                type: 'password',
                required: false,
                helper_text: password_helper_text,
                autocomplete: 'new-password'
              )
            ),
            render(
              FormField::Component.new(
                form:,
                attribute: :password_confirmation,
                type: 'password',
                required: false,
                label: 'Confirm new password',
                autocomplete: 'new-password'
              )
            )
          ]
        )
      end
    end

    def render_confirmation_section(form)
      tag.div class: style(:section) do
        safe_join(
          [
            tag.h3('Confirm Changes', class: style(:section_heading)),
            tag.p(class: 'text-sm text-gray-500') do
              'We need your current password to confirm your changes'
            end,
            render(
              FormField::Component.new(
                form:,
                attribute: :current_password,
                type: 'password',
                required: true,
                autocomplete: 'current-password'
              )
            )
          ]
        )
      end
    end

    def render_danger_zone
      tag.div class: style(:danger_section) do
        tag.div class: style(:danger_zone) do
          safe_join(
            [
              tag.h3('Delete Account', class: style(:section_heading)),
              tag.p(class: 'mt-1 text-sm text-gray-500') do
                'Once you delete your account, there is no going back. Please be certain.' # rubocop:disable I18n/RailsI18n/DecorateString
              end,
              tag.div(class: 'mt-4') do
                button_to(
                  helpers.send(:registration_path, resource_name),
                  method: :delete,
                  class: style(:danger_button),
                  form: { data: { turbo_confirm: 'Are you sure you want to delete your account?' }} # rubocop:disable I18n/RailsI18n/DecorateString
                ) do
                  'Delete account'
                end
              end
            ]
          )
        end
      end
    end

    def render_footer
      tag.div class: style(:footer) do
        link_to(
          '← Back',
          :back,
          class: style(:footer_link)
        )
      end
    end

    def render_email_confirmation_notice
      return unless resource.pending_reconfirmation?

      tag.div class: 'mt-2 text-sm text-gray-500' do
        "Currently waiting confirmation for: #{resource.unconfirmed_email}"
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
