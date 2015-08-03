require 'app'
require 'models/honey'

RSpec.feature SG::App do
  background do
    Capybara.app = described_class
  end

  scenario 'get /' do
    visit '/'
    expect(page).to have_title('SG')
    expect(page).to have_content('Hello, SG!')
  end

  feature 'post /' do
    scenario 'with nothing' do
      page.driver.post('/')
      expect(SG::Honey.all.size).to eq(0)
    end

    scenario 'with empty' do
      page.driver.post('/', {}.to_json)
      expect(SG::Honey.all.size).to eq(1)
      expect(SG::Honey.first.attributes.size).to eq(1)
    end

    scenario 'with empty' do
      page.driver.post('/', { a: 1, b: 2 }.to_json)
      expect(SG::Honey.all.size).to eq(1)
      expect(SG::Honey.first.attributes.size).to eq(3)
    end
  end
end
