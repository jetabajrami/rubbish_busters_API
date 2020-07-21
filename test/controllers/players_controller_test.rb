require "test_helper"

describe PlayersController do
  it "must get index" do
    get players_index_url
    must_respond_with :success
  end

end
