require 'rails_helper'

RSpec.feature "The delete authors button", type: :feature do
  before :each do
    @author = FactoryBot.create(:author)
    @author2 = FactoryBot.create(:author)
  end
  # it 'should delete an author' do
  #   visit authors_path
  #   expect(Author.count).to eq(2)
  #   click_link first(:link, 'Delete')
  #   expect(Author.count).to eq(1)
  #   expect(Author.first.name).to eq(@author2.name)
  # end
end
