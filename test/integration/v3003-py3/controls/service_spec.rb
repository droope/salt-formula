# frozen_string_literal: true

services =
  case system.platform[:family]
  when 'bsd'
    %w[salt_master salt_minion]
  when 'windows'
    %w[salt-minion]
  else
    %w[salt-master salt-minion]
  end

control 'salt services' do
  title 'should be running'

  services.each do |p|
    describe service(p) do
      it { should be_installed }
      it { should be_enabled }
      it { should be_running }
    end
  end
end
