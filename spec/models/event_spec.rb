require 'rails_helper'

RSpec.describe Event, type: :model do
  describe '#name' do
    it { should validate_presence_of :name }
    it { should validate_length_of(:name).is_at_most 50 }
  end

  describe '#created_by?' do
    let(:event) { create(:event) }
    subject { event.created_by?(user) }

    context '引数が nil なとき' do
      let(:user) { nil }
      it { should be_falsey }
    end

    context '#owner_id と 引数の #id が同じとき' do
      let(:user) { double('user', id: event.id) }
      it { should be_truthy }
    end
  end

  describe '#rails?' do
    context '#name が "Rails 勉強会" のとき' do
      it 'true を返すこと' do
        event = create(:event, name: 'Rails 勉強会')
        expect(event.rails?).to eq true
      end
    end
  end
end
