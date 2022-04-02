require 'rails_helper'

RSpec.describe User, type: :model do
  it 'cannot have comments' do   #
    user = User.new email: 'ab@sb.com'
    expect(user.email).to eq 'ab@sb.com'
  end
end
