require 'rails_helper'

RSpec.describe Author, type: :model do
  before do
    @author = Author.new
    @author.first_name='Alan' 
    @author.last_name='Turing'
    @author.homepage='http://wikipedia.org/Alan_Turing'
  end

  it 'should have user-defined fields ' do
    expect(@author.first_name).to eq('Alan')
    expect(@author.last_name).to eq('Turing')
  end
  it 'should have computed fields' do
    expect(@author.name).to eq('Alan Turing')
  end
end
