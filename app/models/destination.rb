class Destination < ApplicationRecord
    has_many :posts
    has_many :bloggers, through: :posts

    def recent_posts
        self.posts.sort {|post_a, post_b| post_a.updated_at <=> post_b.updated_at }
    end

    def total_likes
        self.posts.sum {|post| post.likes}
    end

    def featured_post
        if self.total_likes == 0
            "This destination's posts have no likes!"
        else
            self.most_liked_post
        end
    end

    def most_liked_post
        self.posts.max_by {|post| post.likes}
    end

    def average_blogger_age
        self.bloggers.uniq.sum {|blogger| blogger.age} / self.bloggers.uniq.count
    end
end
