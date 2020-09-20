config.app_access_token = "350805096110822|a7ulG2Ic4tReerhPrHzGEIBn2Tw"
config.app_id = "350805096110822"
config.app_secret = "1d5b206ff77eb688f7ca3116c7056ad0"

access_token = ""

>>>>  long_
  access_token = "EAAEZCDi0jmuYBAAtVn4xcLb05kZBa2tJCMP3gN7OSwcKUxlSCrWKrwCr5wcOATcXbFlw3UIp6KpOwAHxdZAIZC697gZAkDhzCxUfVuZAVTvOkwdPOgrCyjeJzUCfcbAr0D7zeJIV4seZBUVyXF8BIGUNiiocoJZA8zgdb6K1QG9S4QZDZD"
>>>>  long_
access_token = "EAAEZCDi0jmuYBAIF6rESYBBCg84ooButbGTPhblK2VeY9P4bUH3HiZBUvBZAbvKtusjTBZCnzb6BpRUh0EunYoMTcxfm9gVVcYbAhaZCL1YBYZCaeGvXhpQTwDszOgb9nlWoSntscaKQ7BRzWK2foQoDDLiDjXinSrONC4bdH1sZCDZB8epu5K4MPYFvZALw5s3Oy72shZCNJ4R6beWRG5dHdsBPBtKqNbiUnClQmBJ3TGlQZDZD"
@graph = Koala::Facebook::API.new(access_token)

  profile = @graph.get_object("me")

groups = @graph.get_connections 'me', :groups

test_group = groups.first

test_group["id"] 
test_group["name"] 

"name": "Test",
      "id": "314547422976759"
FBTest
757090528181742

group_posts = @graph.get_object("#{test_group['id']}/feed")


curl -i -X GET "https://graph.facebook.com/v8.0/oauth/access_token?  
    grant_type=fb_exchange_token&          
    client_id=350805096110822&
    client_secret=1d5b206ff77eb688f7ca3116c7056ad0&
    fb_exchange_token=EAAEZCDi0jmuYBAIF6rESYBBCg84ooButbGTPhblK2VeY9P4bUH3HiZBUvBZAbvKtusjTBZCnzb6BpRUh0EunYoMTcxfm9gVVcYbAhaZCL1YBYZCaeGvXhpQTwDszOgb9nlWoSntscaKQ7BRzWK2foQoDDLiDjXinSrONC4bdH1sZCDZB8epu5K4MPYFvZALw5s3Oy72shZCNJ4R6beWRG5dHdsBPBtKqNbiUnClQmBJ3TGlQZDZD" 
 
 => [{"message"=>"test 3 post", 
  "updated_time"=>"2020-09-18T18:31:40+0000",
   "id"=>"314547422976759_314762476288587"}, 


rails g scaffold groups name:string fb_id:string description:text privacy:string user:references
rails g scaffold posts message:string fb_id:string updated_time:string group:references

rake db:migrate

rails g devise:install

Add devise config to config/environments/development.rb
config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }
run rails g devise User
run rake db:migrate
run rails g devise:views


gem 'omniauth-facebook'
rails g migration AddOmniauthToUsers provider:string uid:string name:string image:text token:string
