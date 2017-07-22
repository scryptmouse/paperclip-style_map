RSpec.describe Paperclip::StyleMap::HasStyleMap do
  let(:fake_style_map) { double('Fake Style Map') }

  let(:pseudo_attachment_class) do
    Struct.new(:instance) do
      prepend Paperclip::StyleMap::HasStyleMap
    end
  end

  let(:test_model) { double('Test Model') }

  let(:pseudo_attachment) do
    pseudo_attachment_class.new(test_model)
  end

  before(:each) do
    allow(Paperclip::StyleMap::Map).to receive(:new).and_return(fake_style_map)
    allow(pseudo_attachment).to receive(:instance).and_call_original
    allow(pseudo_attachment).to receive(:style_map).and_call_original
  end

  it 'memoizes the creation of a style map' do
    4.times { pseudo_attachment.style_map }

    expect(Paperclip::StyleMap::Map).to have_received(:new).once.with(model: test_model, attachment: pseudo_attachment)
  end
end
