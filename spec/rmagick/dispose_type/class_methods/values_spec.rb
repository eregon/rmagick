RSpec.describe Magick::DisposeType, '.values' do
  it 'does not cause an infinite loop' do
    img = Magick::Image.new(1, 1)
    Magick::DisposeType.values do |value|
      img.dispose = value
      expect(img.dispose).to eq(value)
    end
  end
end
