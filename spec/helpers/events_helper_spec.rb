require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the EventsHelper. For example:
#
# describe EventsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe EventsHelper, type: :helper do
  describe 'datetime_select_now は' do
    let (:now) { Time.zone.now }
    let (:form) { double('form_for') }

    before do
      allow(form).to receive(:datetime_select).and_return :column
    end

    it 'カラム名を受け取る' do
      expect(helper.datetime_select_now(form, :column)).to eq :column
    end
  end

  pending 'submit_tag_with_label'
  pending 'button_tag_with_label'
  pending 'link_to_edit_event'
  pending 'link_to_delete_event'
  pending 'button_tag_for_new_event_ticket'
  pending 'link_to_new_event_ticket'
  pending 'modal_tag'
  pending 'close_button_tag'
  pending 'build_ticket_form_for'
end
