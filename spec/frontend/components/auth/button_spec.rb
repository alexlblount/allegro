# frozen_string_literal: true

require 'rails_helper'

describe Auth::Button::Component do # rubocop:disable RSpec/SpecFilePathFormat
  subject(:button) { rendered_content }

  let(:options) { {} }
  let(:component) { described_class.new(**options) }

  it 'renders' do
    render_inline(component)

    expect(button).to have_css 'div'
  end
end
