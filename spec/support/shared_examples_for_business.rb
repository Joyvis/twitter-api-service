# frozen_string_literal: true

require 'rails_helper'

RSpec.shared_examples 'is expected to be' do |entity|
  it { is_expected.to be_a Array }
  it { expect(subject.first).to be_an_instance_of(entity) }
end
