require 'rails_helper'

RSpec.describe "Authors", type: :request do
  describe "The Authors page" do
    before do
      @author = Author.new
      @author.first_name='Alan' 
      @author.last_name='Turing'
      @author.homepage='http://wikipedia.org/Alan_Turing'
    end
    it "should have the content 'Authors'" do
      visit author_path(@author)
      expect(page).to have_content('Author')
      expect(page).to have_content('Alan')
      expect(page).to have_content('Turing')
      expect(page).to have_content('http://wikipedia.org/Alan_Turing')
    end

  end
end
