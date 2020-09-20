class HomeController < ApplicationController
  # def index; end
  def index
    notifications = []
  	#initilaize API #check token first
    # access_token = "EAAEZCDi0jmuYBAAtVn4xcLb05kZBa2tJCMP3gN7OSwcKUxlSCrWKrwCr5wcOATcXbFlw3UIp6KpOwAHxdZAIZC697gZAkDhzCxUfVuZAVTvOkwdPOgrCyjeJzUCfcbAr0D7zeJIV4seZBUVyXF8BIGUNiiocoJZA8zgdb6K1QG9S4QZDZD"
    # @graph = Koala::Facebook::API.new(access_token) #rescue ""
    @graph = Koala::Facebook::API.new(current_user.token) #rescue ""
  	# profile = @graph.get_object("me")
  	groups = @graph.get_connections 'me', :groups #rescue ""
    if groups.present?
      update_group_data(groups)
    end
  	test_group = groups.first #fb
    groups = current_user.groups
    # group =  Group.find_by_fb_id(test_group['id']) #db
    groups.each do |group|
    	group_posts = @graph.get_object("#{group['fb_id']}/feed") rescue ""
      new_records = []
      if group_posts.present?
        new_records = update_post_data(group, group_posts)
      end
      # check for keywords match
      if new_records.present?
        keywords = group.keywords.map(&:keyword)
        new_records.each do |record|
          if keywords.any? {|s| record.message.include? s}
            # send_notification here
            # puts "--------------------------------------------------------"
            # puts "--------------------------------------------------------"
            notifications << "#{group.name} has added a new post matching to your keyword"
            # puts "#{group.name} has added a new post matching to your post"
            # puts "--------------------------------------------------------"
            # puts "--------------------------------------------------------"
          end
        end

      end
    end
    puts "--------------------------------------------------------"
    puts notifications
    puts "--------------------------------------------------------"    
  end

  def update_group_data(fb_groups)
    fb_groups.each do |fb_group|
      group = Group.find_or_initialize_by(user_id: current_user.id, name: fb_group['name'],fb_id: fb_group['id'])
      unless group.persisted?
        group.privacy = fb_group['privacy']
        group.save
        puts "-- Group saved -- #{fb_group['name']} --"
      end
    end
  end

  def update_post_data(group, fb_posts)
    new_records = []
    fb_posts.each do |fb_post|
      if fb_post['message'].present?
        post = Post.find_or_initialize_by(group_id: group.id, fb_id: fb_post['id'])
        unless post.persisted?
          post.message = fb_post['message'] rescue ""
          post.updated_time = fb_post['updated_time']
          post.save
          new_records << post
          puts "-- Group saved -- #{fb_post['message']  } --"
        end
      end
    end
    new_records
  end

end
