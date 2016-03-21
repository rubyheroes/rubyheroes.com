require "rails_helper"

RSpec.feature "Heroes" do
  before do
    3.times { create(:hero) }
  end

  let(:latest_hero_year) { Hero.order(:year).last.year }

  it "redirects to the latest year of heroes" do
    visit heroes_path
    expect(current_path).to eq year_heroes_path(latest_hero_year)
  end

end


