require 'app'

RSpec.feature Honeypot::App do
  background do
    Capybara.app = described_class
  end

  scenario 'get /' do
    visit '/'
  end
end
