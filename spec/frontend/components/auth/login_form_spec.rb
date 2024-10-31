# frozen_string_literal: true

require 'rails_helper'

describe Auth::LoginForm::Component do # rubocop:disable RSpec/SpecFilePathFormat
  subject(:form) { rendered_content }

  let(:options) { {} }
  let(:component) { described_class.new(**options) }

  it 'renders' do
    render_inline(component)

    expect(form).to have_css 'div'
  end
end
