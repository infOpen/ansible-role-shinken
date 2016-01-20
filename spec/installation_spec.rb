require 'serverspec'

if ENV['TRAVIS']
    set :backend, :exec
end

describe 'shinken Ansible role' do

if ['debian', 'ubuntu'].include?(os[:family])
    describe 'Specific Debian and Ubuntu family checks' do

        it 'install role packages' do
            packages = Array[ 'apt', 'nagios-plugins',
                              'python-pip', 'python-pycurl',
                              'python-setuptools' ]

            packages.each do |pkg_name|
                expect(package(pkg_name)).to be_installed
            end
        end

        describe user('shinken') do
          it { should exist }
          it { should belong_to_group 'shinken' }
          it { should have_home_directory '/var/lib/shinken' }
          it { should have_login_shell '/bin/bash' }
        end

        describe command('pip list') do
          its(:stdout) { should match /Shinken \(2.4.2\)/ }
        end

        it 'create Shinken structure' do
            directories = Array[ '/etc/shinken',
                                 '/var/lib/shinken/cli',
                                 '/var/lib/shinken/doc',
                                 '/var/lib/shinken/inventory',
                                 '/var/lib/shinken/libexec',
                                 '/var/lib/shinken/modules',
                                 '/var/lib/shinken/share' ]

            directories.each do |dir_name|
                expect(file(dir_name)).to exist
                expect(file(dir_name)).to be_directory
            end
        end
    end
end

end
