require 'rails_helper'

describe Review do
  # Tests will go here.
  it { should belong_to(:product) }
  it { should validate_presence_of :author }
  it { should validate_presence_of :content_body }
  it { should validate_length_of(:content_body).is_at_least(50) }
  it { should validate_length_of(:content_body).is_at_most(250) }
  it { should validate_presence_of :rating }
  it { should validate_numericality_of(:rating).only_integer }
  it { should validate_inclusion_of(:rating).in_array([1,2,3,4,5]) }
end