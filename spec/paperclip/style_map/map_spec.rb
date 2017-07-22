RSpec.describe Paperclip::StyleMap::Map do
  let!(:thing) { create :thing }
  let(:attachment) { thing.asset }
  let(:style_map) { attachment.style_map }

  let(:expected_urls) do
    %i[original small tiny].each_with_object({}.with_indifferent_access) do |style_name, hsh|
      hsh[style_name] = a_kind_of(String)
    end
  end

  it 'is inspectable' do
    expect(style_map.inspect).to be_a_kind_of(String)
  end

  it 'was added to Paperclip::Attachment' do
    expect(attachment).to respond_to :style_map
  end

  it 'can be converted to a hash' do
    expect(style_map.to_h).to include expected_urls
  end

  it 'can fetch a url' do
    expect(style_map.fetch(:original)).to be_a_kind_of(String)
  end

  it 'does not fetch a url for an unknown style' do
    expect(style_map[:unknown_style]).to be_nil
  end

  context 'when an attachment is processing (delayed_paperclip)' do
    before do
      allow(attachment).to receive(:processing?) { true }
    end

    it 'does not fetch the url' do
      expect(style_map[:original]).to be_nil
    end
  end

  context 'when an attachment does not exist' do
    before { allow(attachment).to receive(:exists?) { false } }

    it 'does not fetch the url' do
      expect(style_map[:original]).to be_nil
    end
  end
end
