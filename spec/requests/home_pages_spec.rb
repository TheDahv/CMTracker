require 'spec_helper'

describe "HomePages" do
  describe "Home page" do
    before { visit root_path }
    it { should contain_text 'Pick a class to list the students' }
  end
end
