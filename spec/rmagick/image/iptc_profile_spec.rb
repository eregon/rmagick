RSpec.describe Magick::Image, '#iptc_profile' do
  before do
    @img = Magick::Image.new(100, 100)
    gc = Magick::Draw.new

    gc.stroke_width(5)
    gc.circle(50, 50, 80, 80)
    gc.draw(@img)

    @hat = Magick::Image.read(FLOWER_HAT).first
    @p = Magick::Image.read(IMAGE_WITH_PROFILE).first.color_profile
  end

  it 'works' do
    expect { @img.iptc_profile }.not_to raise_error
    expect(@img.iptc_profile).to be(nil)
    expect { @img.iptc_profile = 'xxx' }.not_to raise_error
    expect(@img.iptc_profile).to eq('xxx')
    expect { @img.iptc_profile = 2 }.to raise_error(TypeError)
  end
end