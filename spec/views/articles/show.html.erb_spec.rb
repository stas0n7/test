require 'rails_helper'

RSpec.describe 'articles/show', type: :view do
  before(:each) do
    assign(:article, Article.create!(name: 'Name', body: 'MyText'))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
  end
end
