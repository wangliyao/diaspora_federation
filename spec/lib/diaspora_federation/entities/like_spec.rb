module DiasporaFederation
  describe Entities::Like do
    let(:data) { FactoryGirl.build(:like_entity).to_h }

    let(:xml) {
      <<-XML
<like>
  <positive>#{data[:positive]}</positive>
  <guid>#{data[:guid]}</guid>
  <target_type>#{data[:parent_type]}</target_type>
  <parent_guid>#{data[:parent_guid]}</parent_guid>
  <parent_author_signature>#{data[:parent_author_signature]}</parent_author_signature>
  <author_signature>#{data[:author_signature]}</author_signature>
  <diaspora_handle>#{data[:diaspora_id]}</diaspora_handle>
</like>
XML
    }

    it_behaves_like "an Entity subclass"

    it_behaves_like "an XML Entity"

    it_behaves_like "a relayable Entity"

    describe "#parent_type" do
      it "returns data[:parent_type] as parent type" do
        expect(described_class.new(data).parent_type).to eq(data[:parent_type])
      end
    end
  end
end
