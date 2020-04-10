require 'rails_helper'

RSpec.describe "NREL API" do
  it "can find nearest fuel station" do
    visit "/"

    page.select 'Turing', from: :location
    click_on "Find Nearest Station"
    expect(current_path).to eq("/search")

    within ".station" do
      expect(first('#name').text).to_not be_empty
      expect(first('#address').text).to_not be_empty
      expect(first('#fuel_type').text).to_not be_empty
      expect(first('#access_times').text).to_not be_empty
    end

    within ".directions" do
      expect(first('#distance').text).to_not be_empty
      expect(first('#travel_time').text).to_not be_empty
      expect(first('#directions').text).to_not be_empty
    end
  end
end
