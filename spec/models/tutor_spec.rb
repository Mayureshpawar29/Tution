require 'rails_helper'

RSpec.describe Tutor, type: :model do
  let(:tutor) { create(:tutor) }

  it 'is valid with valid attributes' do
    expect(tutor).to be_valid
  end

  it 'is not valid without a name' do
    tutor.name = nil
    expect(tutor).not_to be_valid
  end

  it 'is not valid without an email' do
    tutor.email = nil
    expect(tutor).not_to be_valid
  end

  it 'is not valid with an invalid email format' do
    tutor.email = 'invalid_email'
    expect(tutor).not_to be_valid
  end
end
