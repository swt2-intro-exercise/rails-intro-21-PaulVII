require 'rails_helper'

RSpec.describe Author, type: :model do
  before do
    author = Author.new(first_name='Alan', last_name='Turing',homepage='http://wikipedia.org/Alan_Turing')
  end

  it 'should have user-defined fields ' do
    except(author.first_name).to eq('Alan')
    except(author.last_name).to eq('Turing')
  end
  it 'should have computed fields' do
    expect(author.name).to eq('Alan Turing')
  end
end
