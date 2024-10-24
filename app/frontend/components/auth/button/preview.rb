# app/frontend/components/auth/button/preview.rb
# frozen_string_literal: true

module Auth
  class Button::Preview < ApplicationViewComponentPreview
    # You can specify the container class for the default template
    self.container_class = 'w-64 p-4 space-y-4 bg-white'

    def default
      render_component { 'Sign in' }
    end

    def themes
      render_with container_class: 'w-64 p-4 space-y-4 bg-white' do
        safe_join(
          [
            render(Button::Component.new(theme: :primary)) { 'Primary Button' },
            tag.div(class: 'h-4'),
            render(Button::Component.new(theme: :secondary)) { 'Secondary Button' }
          ]
        )
      end
    end

    def sizes
      render_with container_class: 'w-96 p-4 space-y-4 bg-white' do
        safe_join(
          [
            render(Button::Component.new(size: :sm)) { 'Small Button' },
            tag.div(class: 'h-4'),
            render(Button::Component.new(size: :md)) { 'Medium Button' },
            tag.div(class: 'h-4'),
            render(Button::Component.new(size: :lg)) { 'Large Button' }
          ]
        )
      end
    end
  end
end
