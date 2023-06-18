require 'rails_helper'

RSpec.describe 'articles/edit', type: :view do
  let(:article) do
    Article.create!(name: 'MyString', body: 'MyText')
  end

  before(:each) do
    assign(:article, article)
  end

  it 'renders the edit article form' do
    render

    assert_select 'form[action=?][method=?]', article_path(article), 'post' do
      assert_select 'input[name=?]', 'article[name]'

      assert_select 'textarea[name=?]', 'article[body]'
    end
  end
end
