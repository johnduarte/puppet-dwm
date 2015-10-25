require 'spec_helper'
describe 'dwm' do

  context 'with defaults for all parameters' do
    it { should contain_class('dwm') }
  end
end
