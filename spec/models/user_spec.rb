 require 'rails_helper'
 
 describe User do
 
   include TestFactories
    
   describe "#favorited(post)" do
    
    before do
      @user = create(:user)
      @post = create(:post)
      @comment = create(:comment, user: @user, post: @post)
    end

    it "returns `nil` if the user has not favorited the post" do
      expect(@user.favorited(@post)).to be_nil
    end
 
    it "returns the appropriate favorite if it exists" do
      favorite = @user.favorites.create(post: @post)
      expect(@user.favorited(@post)).to eq(favorite)
    end

    it "returns `nil` if the user has favorited another post" do
        @another_post = Post.create(
                      user: @user, 
                      body: "Damn the body of a post is long.",
                      title: "Title for anothe post.",
                      topic: Topic.create(name: 'Topic name'),
                      )
      

        favorite = @user.favorites.create(post: @post)
        expect(@user.favorited(@another_post)).to be_nil
    end     
  end
end