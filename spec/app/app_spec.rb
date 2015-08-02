require 'app'

RSpec.feature Honeypot::App do
  background do
    Capybara.app = described_class
  end

  scenario 'get /' do
    visit '/'
    expect(page).to have_title('Honeypot')
    expect(page).to have_content('Hello, Honeypot!')
  end
end
