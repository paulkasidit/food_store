require 'rails_helper'

describe Product do
  # Tests will go here.
  it { should have_many(:reviews) }
end