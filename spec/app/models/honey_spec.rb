require 'app'
require 'models/honey'

RSpec.describe SG::Honey do
  it 'saves anything' do
    described_class.new(a: 3, b: 4).save
    expect(described_class.all.size).to eq(1)
    expect(described_class.first.a).to eq(3)
    expect(described_class.first.b).to eq(4)
  end
end
