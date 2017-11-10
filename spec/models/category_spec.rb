require 'rails_helper'

RSpec.describe Category, type: :model do
#  pending "add some examples to (or delete) #{__FILE__}"

  let(:subject) { create(:category) }

  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_uniqueness_of(:name) }

end
