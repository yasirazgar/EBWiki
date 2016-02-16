require 'rails_helper'

RSpec.describe User, type: :model do
	# let(:user) { create(:user) }

	# it "calls mailchimp correctly" do
 #    opts = {
 #      email: {email: user.email},
 #      id: ENV['MAILCHIMP_LIST_ID'],
 #      double_optin: true,
 #    }
 #    clazz = Rails.configuration.mailchimp.lists.class
 #    clazz.any_instance.should_receive(:subscribe).with(opts).once
 #    user.send(:add_to_mailchimp, true)
 #  end

  it "returns the correct MailChimp status for the user email" do
  	stub_request(:get, "https://apikey:3d0b601bd3197356fdc8088cce0a7be9-us11@us11.api.mailchimp.com/3.0/lists/0e4679a39d/members/b58996c504c5638798eb6b511e6f49af").
         with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'Content-Type'=>'application/json', 'User-Agent'=>'Faraday v0.9.1'}).
         to_return(:status => 200, :body => "", :headers => {})

    uri = URI("https://us11.api.mailchimp.com/3.0/lists/#{ENV['MAILCHIMP_LIST_ID']}/meßmbers")

    response = Net::HTTP.get(uri)

    expect(response).to be_an_instance_of(String)

  end

  it "adds a user to the newsletter if the 'subscribed' box is checked" do

  end

  it "returns 'pending' for users who have subscribed on the EBW subscribe box but not email confirmation" do

  end

  it "returns 'pending' for users who have subscribed via the MC web form but not email confirmation" do

  end

  it "returns subscribed for users who have subscribed via the MailChimp web form and confirmed" do

  end

  it "unsubscribes the user from the newsletter if 'subscribed' box is unchecked" do

  end

  it "returns unsubscribed for users who have unchecked the EBW subscribe box" do

  end

  it "returns unsubscribed for users who have clicked the unsubscribed link in an email" do

  end
end