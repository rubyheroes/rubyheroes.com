require 'spec_helper'

describe HomeController do
  context 'using GET on #show' do
    before do
      Hero.should_receive(:find).twice.with(:random).and_return(:a)
      get :show
    end

    it { should assign_to(:heroes).with([:a,:a]) }
    it { should render_template(:show) }
    it { should render_with_layout }
  end
end
