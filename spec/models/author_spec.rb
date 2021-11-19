require 'rails_helper'

RSpec.describe Author, type: :model do
  it 'can be created' do
    @author = Author.new
    @author.first_name='Alan' 
    @author.last_name='Turing'
    @author.homepage='http://wikipedia.org/Alan_Turing'
    expect(@author).to be_valid
  end
  it 'must have a last name' do
    @author = Author.new
    @author.first_name='Alan' 
    @author.homepage='http://wikipedia.org/Alan_Turing'
    expect(@author).to_not be_valid
  end
end
