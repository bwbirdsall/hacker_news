require 'spec_helper'

describe User do
  it { should have_many :comments }
  it { should have_many :links }
  it { should validate_presence_of :username }
  it { should validate_uniqueness_of :username }
end
