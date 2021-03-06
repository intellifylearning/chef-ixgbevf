
default['ixgbevf']['version'] = "3.2.2"
default['ixgbevf']['package'] = "ixgbevf-#{node['ixgbevf']['version']}.tar.gz"
default['ixgbevf']['package_url'] = "http://sourceforge.net/projects/e1000/files/ixgbevf%20stable/#{node['ixgbevf']['version']}/#{node['ixgbevf']['package']}"
default['ixgbevf']['dir']     = "/usr/src/ixgbevf-#{node['ixgbevf']['version']}"
default['ixgbevf']['module_flags'] = "InterruptThrottleRate=1,1,1,1,1,1,1,1"
default['ixgbevf']['disable_ifnames'] = false
default['ixgbevf']['compile_time'] = true
default['ixgbevf']['dkms_dir'] = '/var/lib/dkms/ixgbevf'

case node['platform']
  when 'ubuntu'
    if node['platform_version'].to_f >= 14.04
      default['ixgbevf']['disable_ifnames'] = true
    end
  when 'debian'
    if node['platform_version'].to_f >= 8.0
      default['ixgbevf']['disable_ifnames'] = true
    end
  when 'centos', 'rhel'
    if node['platform_version'].to_f >= 7.0
      default['ixgbevf']['disable_ifnames'] = true
    end
end

