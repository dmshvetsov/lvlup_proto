require 'rails_helper'

RSpec.describe "main/show.html.erb", :type => :view do
  it 'show login button' do
    render
    expect(rendered).to have_link 'Login with facebook'
  end
end
