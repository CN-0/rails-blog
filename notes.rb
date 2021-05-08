#rails commands
rails _4.2.0_ new hello_app
bundle install
bundle install --without production
rails server -b $IP -p $PORT
rails generate controller Articles index --skip-routes
rails generate model Comment commenter:string body:text article:references
rails db:migrate
rails console
rails routes
rails generate migration AddStatusToArticles status:string

#db
article = Article.new(title: "Hello Rails", body: "I am on Rails!")
article.save
Article.find(1)
Article.all
@article.destroy
belongs_to :article
has_many :comments, dependent: :destroy
validates :body, presence: true, length: { minimum: 10 }

#git
git config --global user.name "Your Name"
git config --global user.email your.email@example.com
git checkout -f
git commit -a -m "Improve the README file"
git merge modify-README
git branch -d modify-README
git branch -D topic-branch


#routes
root "articles#index"
get "/articles", to: "articles#index"
get "/articles/:id", to: "articles#show"  //params[:id]
resources :articles
redirect_to root_path
redirect_to @article

#general
index,show,new,create,edit,update,destroy

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  def hello
    render text: "hello, world!"
  end
end

href="<%= article_path(article) %>"

<%= link_to article.title, article %>
<%= link_to "New Article", new_article_path %>
<%= link_to "Edit", edit_article_path(@article) %>

<%= form_with model: @article do |form| %>
<%= form_with model: [ @article, @article.comments.build ] do |form| %>
    
<%= form.label :title %><br>
<%= form.text_field :title %>
<% @article.errors.full_messages_for(:title).each do |message| %>
    <div><%= message %></div>
<% end %>

<%= render "form", article: @article %>

<%= link_to "Destroy", article_path(@article),method: :delete,data: { confirm: "Are you sure?" } %>

<% unless article.archived? %>

http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]
http_basic_authenticate_with name: "dhh", password: "secret", only: :destroy
