require 'rails_helper'

describe 'Visitor Registeration' do
  it 'vistitor can register using google Oath' do
    visit '/'
    click_on("Register")

    expect(current_path).to eq(registration_path)

    
  end
end
