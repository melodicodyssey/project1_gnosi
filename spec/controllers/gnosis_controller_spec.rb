require 'spec_helper'

describe GnosisController do

	describe "GET index" do
		it "should assign user" do
			get :index
			expect(assigns(:user))
		end
		it "should render index page" do
				get :index
				expect(response).to render_template "index"
		end

	end


end