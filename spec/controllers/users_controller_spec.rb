require 'spec_helper'

describe UsersController do

	it "should create a new user" do
		allow(User).to receive(:create)
	end
end