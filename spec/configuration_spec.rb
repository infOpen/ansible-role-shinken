require 'serverspec'

if ENV['TRAVIS']
    set :backend, :exec
end

describe 'shinken Ansible role configuration' do

    # Define variables
    shinken_group = ''
    shinken_home = ''
    shinken_path_etc = ''
    shinken_user = ''

    if ['debian', 'ubuntu'].include?(os[:family])
        shinken_group = 'shinken'
        shinken_home = '/var/lib/shinken'
        shinken_path_etc = '/etc/shinken'
        shinken_user = 'shinken'
    end

    # Shinken is initialized
    describe file("#{shinken_home}/.shinken.ini") do
        it { should exist }
        it { should be_file }
        it { should be_owned_by shinken_user }
        it { should be_grouped_into shinken_group }
    end

    # Main configuration file
    describe file("#{shinken_path_etc}/shinken.cfg") do
        it { should exist }
        it { should be_file }
        it { should be_owned_by shinken_user }
        it { should be_grouped_into shinken_group }
    end

    # Broker configuration file
    describe file("#{shinken_path_etc}/brokers/broker-master.cfg") do
        it { should exist }
        it { should be_file }
        it { should be_owned_by shinken_user }
        it { should be_grouped_into shinken_group }
    end

    # Scheduler configuration file
    describe file("#{shinken_path_etc}/schedulers/scheduler-master.cfg") do
        it { should exist }
        it { should be_file }
        it { should be_owned_by shinken_user }
        it { should be_grouped_into shinken_group }
    end

    # Receiver configuration file
    describe file("#{shinken_path_etc}/receivers/receiver-master.cfg") do
        it { should exist }
        it { should be_file }
        it { should be_owned_by shinken_user }
        it { should be_grouped_into shinken_group }
    end

    # Reactionner configuration file
    describe file("#{shinken_path_etc}/reactionners/reactionner-master.cfg") do
        it { should exist }
        it { should be_file }
        it { should be_owned_by shinken_user }
        it { should be_grouped_into shinken_group }
    end

    # Poller configuration file
    describe file("#{shinken_path_etc}/pollers/poller-master.cfg") do
        it { should exist }
        it { should be_file }
        it { should be_owned_by shinken_user }
        it { should be_grouped_into shinken_group }
    end

    # Arbiter configuration file
    describe file("#{shinken_path_etc}/arbiters/arbiter-master.cfg") do
        it { should exist }
        it { should be_file }
        it { should be_owned_by shinken_user }
        it { should be_grouped_into shinken_group }
    end

    # Resources configuration files
    describe file("#{shinken_path_etc}/resource.d/paths.cfg") do
        it { should exist }
        it { should be_file }
        it { should be_owned_by shinken_user }
        it { should be_grouped_into shinken_group }
    end
    describe file("#{shinken_path_etc}/resource.d/snmp.cfg") do
        it { should exist }
        it { should be_file }
        it { should be_owned_by shinken_user }
        it { should be_grouped_into shinken_group }
    end

    # Host configuration files
    describe file("#{shinken_path_etc}/hosts/host_excludes.cfg") do
        it { should exist }
        it { should be_file }
        it { should be_owned_by shinken_user }
        it { should be_grouped_into shinken_group }
    end
    describe file("#{shinken_path_etc}/hosts/host_overrides.cfg") do
        it { should exist }
        it { should be_file }
        it { should be_owned_by shinken_user }
        it { should be_grouped_into shinken_group }
    end

    # Service configuration files
    describe file("#{shinken_path_etc}/services/host_excludes__service_excludes_1.cfg") do
        it { should exist }
        it { should be_file }
        it { should be_owned_by shinken_user }
        it { should be_grouped_into shinken_group }
    end
    describe file("#{shinken_path_etc}/services/host_excludes__service_excludes_2.cfg") do
        it { should exist }
        it { should be_file }
        it { should be_owned_by shinken_user }
        it { should be_grouped_into shinken_group }
    end
    describe file("#{shinken_path_etc}/services/host_overrides__service_overrides_1.cfg") do
        it { should exist }
        it { should be_file }
        it { should be_owned_by shinken_user }
        it { should be_grouped_into shinken_group }
    end
    describe file("#{shinken_path_etc}/services/host_overrides__service_overrides_2.cfg") do
        it { should exist }
        it { should be_file }
        it { should be_owned_by shinken_user }
        it { should be_grouped_into shinken_group }
    end

    # Realm configuration file
    describe file("#{shinken_path_etc}/realms/all.cfg") do
        it { should exist }
        it { should be_file }
        it { should be_owned_by shinken_user }
        it { should be_grouped_into shinken_group }
    end
    describe file("#{shinken_path_etc}/realms/foo.cfg") do
        it { should exist }
        it { should be_file }
        it { should be_owned_by shinken_user }
        it { should be_grouped_into shinken_group }
    end

    # Contact configuration file
    describe file("#{shinken_path_etc}/contacts/contact_full.cfg") do
        it { should exist }
        it { should be_file }
        it { should be_owned_by shinken_user }
        it { should be_grouped_into shinken_group }
    end
    describe file("#{shinken_path_etc}/contacts/contact_minimal.cfg") do
        it { should exist }
        it { should be_file }
        it { should be_owned_by shinken_user }
        it { should be_grouped_into shinken_group }
    end

    # Contactgroup configuration file
    describe file("#{shinken_path_etc}/contactgroups/contactgroup_full.cfg") do
        it { should exist }
        it { should be_file }
        it { should be_owned_by shinken_user }
        it { should be_grouped_into shinken_group }
    end
    describe file("#{shinken_path_etc}/contactgroups/contactgroup_minimal.cfg") do
        it { should exist }
        it { should be_file }
        it { should be_owned_by shinken_user }
        it { should be_grouped_into shinken_group }
    end

    # Hostgroup configuration file
    describe file("#{shinken_path_etc}/hostgroups/hostgroup_full.cfg") do
        it { should exist }
        it { should be_file }
        it { should be_owned_by shinken_user }
        it { should be_grouped_into shinken_group }
    end
    describe file("#{shinken_path_etc}/hostgroups/hostgroup_minimal.cfg") do
        it { should exist }
        it { should be_file }
        it { should be_owned_by shinken_user }
        it { should be_grouped_into shinken_group }
    end

    # Servicegroup configuration file
    describe file("#{shinken_path_etc}/servicegroups/servicegroup_full.cfg") do
        it { should exist }
        it { should be_file }
        it { should be_owned_by shinken_user }
        it { should be_grouped_into shinken_group }
    end
    describe file("#{shinken_path_etc}/servicegroups/servicegroup_minimal.cfg") do
        it { should exist }
        it { should be_file }
        it { should be_owned_by shinken_user }
        it { should be_grouped_into shinken_group }
    end

    # Timeperiods testing
    describe file("#{shinken_path_etc}/timeperiods/timeperiod_full.cfg") do
        it { should exist }
        it { should be_file }
        it { should be_owned_by shinken_user }
        it { should be_grouped_into shinken_group }
    end
    describe file("#{shinken_path_etc}/timeperiods/timeperiod_minimal.cfg") do
        it { should exist }
        it { should be_file }
        it { should be_owned_by shinken_user }
        it { should be_grouped_into shinken_group }
    end

    # Notificationway testing
    describe file("#{shinken_path_etc}/notificationways/notificationway_full.cfg") do
        it { should exist }
        it { should be_file }
        it { should be_owned_by shinken_user }
        it { should be_grouped_into shinken_group }
    end
    describe file("#{shinken_path_etc}/notificationways/notificationway_minimal.cfg") do
        it { should exist }
        it { should be_file }
        it { should be_owned_by shinken_user }
        it { should be_grouped_into shinken_group }
    end

    # Dependencies testing
    describe file("#{shinken_path_etc}/dependencies/host__dependency_bar.cfg") do
        it { should exist }
        it { should be_file }
        it { should be_owned_by shinken_user }
        it { should be_grouped_into shinken_group }
    end
    describe file("#{shinken_path_etc}/dependencies/service__dependency_foo.cfg") do
        it { should exist }
        it { should be_file }
        it { should be_owned_by shinken_user }
        it { should be_grouped_into shinken_group }
    end

    # Escalations testing
    describe file("#{shinken_path_etc}/escalations/host__escalation_bar.cfg") do
        it { should exist }
        it { should be_file }
        it { should be_owned_by shinken_user }
        it { should be_grouped_into shinken_group }
    end
    describe file("#{shinken_path_etc}/escalations/service__escalation_foo.cfg") do
        it { should exist }
        it { should be_file }
        it { should be_owned_by shinken_user }
        it { should be_grouped_into shinken_group }
    end

    # Templates testing
    describe file("#{shinken_path_etc}/templates/host__foobar_host.cfg") do
        it { should exist }
        it { should be_file }
        it { should be_owned_by shinken_user }
        it { should be_grouped_into shinken_group }
    end
    describe file("#{shinken_path_etc}/templates/service__foobar_service.cfg") do
        it { should exist }
        it { should be_file }
        it { should be_owned_by shinken_user }
        it { should be_grouped_into shinken_group }
    end
    describe file("#{shinken_path_etc}/templates/contact__foobar_contact.cfg") do
        it { should exist }
        it { should be_file }
        it { should be_owned_by shinken_user }
        it { should be_grouped_into shinken_group }
    end

    # Modules configuration testing
    describe file("#{shinken_path_etc}/modules/graphite.cfg") do
        it { should exist }
        it { should be_file }
        it { should be_owned_by shinken_user }
        it { should be_grouped_into shinken_group }
    end
    describe file("#{shinken_path_etc}/modules/mongo-logs.cfg") do
        it { should exist }
        it { should be_file }
        it { should be_owned_by shinken_user }
        it { should be_grouped_into shinken_group }
    end
    describe file("#{shinken_path_etc}/modules/retention-redis.cfg") do
        it { should exist }
        it { should be_file }
        it { should be_owned_by shinken_user }
        it { should be_grouped_into shinken_group }
    end
    describe file("#{shinken_path_etc}/modules/ui-graphite2.cfg") do
        it { should exist }
        it { should be_file }
        it { should be_owned_by shinken_user }
        it { should be_grouped_into shinken_group }
    end
    describe file("#{shinken_path_etc}/modules/webui2.cfg") do
        it { should exist }
        it { should be_file }
        it { should be_owned_by shinken_user }
        it { should be_grouped_into shinken_group }
    end

    # Package installation testing
    describe file("#{shinken_path_etc}/packs/linux-ssh/commands.cfg") do
        it { should exist }
        it { should be_file }
        it { should be_owned_by shinken_user }
        it { should be_grouped_into shinken_group }
    end
end

