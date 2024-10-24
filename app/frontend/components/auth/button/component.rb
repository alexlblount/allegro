# app/frontend/components/auth/button/component.rb
# frozen_string_literal: true

module Auth
  class Button::Component < ApplicationViewComponent
    include ViewComponentContrib::StyleVariants

    style do
      base do
        %w[
          flex
          w-full
          justify-center
          rounded-md
          px-3
          py-1.5
          text-sm
          font-semibold
          leading-6
          shadow-sm
          focus-visible:outline
          focus-visible:outline-2
          focus-visible:outline-offset-2
        ]
      end

      variants do
        theme do
          primary do
            %w[
              bg-indigo-600
              text-white
              hover:bg-indigo-500
              focus-visible:outline-indigo-600
            ]
          end
          secondary do
            %w[
              bg-white
              text-indigo-600
              hover:text-indigo-500
              border
              border-indigo-600
            ]
          end
        end

        size do
          sm { 'text-sm' }
          md { 'text-base' }
          lg { 'text-lg' }
        end
      end

      defaults { { theme: :primary, size: :sm } }
    end

    option :theme, optional: true
    option :size, optional: true
    option :type, default: proc { 'submit' }

    def call
      button_tag type:, class: style(theme:, size:) do
        content
      end
    end
  end
end
