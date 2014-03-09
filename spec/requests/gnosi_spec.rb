require 'spec_helper'

	describe 'Gnosi' do

		describe "GET /gnosi/start" do
			it "should be successful" do
				get start_path
				response.status.should == 200
			end

			describe "GET /gnosi/feed" do

			end
	end

end
