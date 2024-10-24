# app/frontend/components/auth/form_field/component.rb
# frozen_string_literal: true

module Auth
  class FormField::Component < ApplicationViewComponent
    include ViewComponentContrib::StyleVariants

    style do
      base { 'space-y-2' }

      variants do
        error do
          yes do
            %w[
              text-red-900
              ring-red-300
              placeholder:text-red-300
              focus:ring-red-500
            ]
          end
          no do
            %w[
              text-gray-900
              ring-gray-300
              placeholder:text-gray-400
              focus:ring-indigo-600
            ]
          end
        end
      end
    end

    style :input do
      base do
        %w[
          block
          w-full
          rounded-md
          border-0
          py-1.5
          shadow-sm
          ring-1
          ring-inset
          focus:ring-2
          focus:ring-inset
          sm:text-sm
          sm:leading-6
        ]
      end
    end

    style :label do
      base do
        %w[
          block text-sm font-medium leading-6 text-gray-900
        ]
      end
    end

    style :error do
      base do
        %w[
          mt-2 text-sm text-red-600
        ]
      end
    end

    option :form
    option :attribute
    option :type, default: proc { 'text' }
    option :required, default: proc { false }
    option :label, optional: true
    option :helper_text, optional: true
    option :autocomplete, optional: true

    def call
      tag.div class: style do
        safe_join(
          [
            render_label,
            render_input,
            render_error
          ].compact
        )
      end
    end

    private

    def render_label
      return unless show_label?

      form.label attribute, label, class: style(:label)
    end

    def render_input
      wrapper_classes = 'mt-2'
      input_classes = style(:input, error: form.object.errors.include?(attribute))

      tag.div class: wrapper_classes do
        form.send(
          input_method,
          attribute,
          class: input_classes,
          required:,
          autocomplete:
        )
      end
    end

    def render_error
      return unless form.object.errors.include?(attribute)

      tag.p class: style(:error) do
        form.object.errors.full_messages_for(attribute).join(', ')
      end
    end

    def show_label?
      label || !form.object.class.human_attribute_name(attribute).start_with?('translation missing')
    end

    def input_method
      case type
      when 'text', 'email', 'password'
        "#{type}_field"
      else
        'text_field'
      end
    end
  end
end
