class UsersImport
  attr_reader :success, :failure
  def initialize(seed)
    @success = 0
    @failure = 0
    @seed = seed
    process
  end

  def process
    request_url =
      "https://randomuser.me/api/?format=json&results=30&inc=gender,name,email,picture&nat=br&seed=#{@seed}"
    json_return = JSON.load open(request_url)
    json_return["results"].each do |user|
      self.create_user(user) ? @success += 1 : @failure += 1
    end
  end

  def create_user(user)
    new_user = User.new(
      name:               user["name"]["first"],
      surname:            user["name"]["last"],
      title:              user["name"]["title"],
      email:              user["email"],
      gender:             user["gender"],
      remote_picture_url: user["picture"]["large"]
    )
    new_user.save
  end
end
