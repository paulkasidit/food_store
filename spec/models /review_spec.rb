require 'rails_helper'

describe Review do
  # Tests will go here.
  it { should belong_to(:product) }
end