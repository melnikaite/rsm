require 'spec_helper'

feature "Test" do

context 'choose clip' do
  li = nil

  before do
    visit root_path
    #click_on('get')
    li = page.find(:xpath, '//li[contains(., button)]')
    li.click_on('get')
  end

  context 'wait for result' do

    it 'has links to video' do
      #page.should have_xpath('//a', :text => 'avi')
      li.should have_xpath('//a', :text => 'avi')
    end

  end

end

end