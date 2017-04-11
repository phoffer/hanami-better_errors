require 'spec_helper'
require_relative '../../../../apps/web/controllers/home/error'

describe Web::Controllers::Home::Error do
  let(:action) { Web::Controllers::Home::Error.new }
  let(:params) { Hash[] }

  it 'is successful' do
    response = action.call(params)
    response[0].must_equal 200
  end
end
