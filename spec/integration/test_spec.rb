require 'spec_helper'

feature "Course" do

context 'choose clip' do

  before do
    visit root_path
    click_on('get')
  end

  context 'wait for result' do

    it 'has links to video' do
      page.should have_xpath('//a', :text => 'avi')
    end

  end

end

end