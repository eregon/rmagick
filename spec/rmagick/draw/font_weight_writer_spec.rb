RSpec.describe Magick::Draw, '#font_weight=' do
  before do
    @draw = Magick::Draw.new
  end

  it 'works' do
    Magick::WeightType.values do |weight|
      expect { @draw.font_weight = weight }.not_to raise_error
    end

    expect { @draw.font_weight = 99 }.to raise_error(ArgumentError)
    expect { @draw.font_weight = 901 }.to raise_error(ArgumentError)
  end
end
