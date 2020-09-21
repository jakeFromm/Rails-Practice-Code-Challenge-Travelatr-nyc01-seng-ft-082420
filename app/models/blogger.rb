class Blogger < ApplicationRecord
    has_many :posts
    has_many :destinations, through: :posts

    validates :name, uniqueness: true
    validates :age, numericality: {greater_than: 0}
    validates :bio, length: {minimum: 31}

    def total_likes
        self.posts.sum {|post| post.likes}
    end

    def featured_post
        if self.total_likes == 0
            "This blogger's posts have no likes!"
        else
            self.most_liked_post
        end
    end

    def most_liked_post
        self.posts.max_by {|post| post.likes}
    end

end
