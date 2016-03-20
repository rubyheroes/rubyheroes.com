require "rails_helper"

RSpec.feature "Heroes" do
  # In order to view past heroes
  # Without first going to the home page
  # I should be redirected
  before do
    3.times { create(:hero) }
  end

  it "displays past heroes" do
    visit heroes_path
    expect(current_path).to eq root_path
  end

end


