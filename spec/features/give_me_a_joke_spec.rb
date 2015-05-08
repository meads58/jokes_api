require 'spec_helper'


feature 'Getting a joke' do

  scenario 'As a wannabe comedian I want to get a random joke' do
    visit '/'
    click_on 'Give Me More'
    expect(page).to have_content 'The Mule Norris'
  end

end