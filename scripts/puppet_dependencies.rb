def install_dep(name, version, install_dir = nil)
    install_dir ||= '/vagrant/puppet/modules'
    if version != ""
    	version = "-v " + version
    end
    "mkdir -p #{install_dir} && (puppet module list | grep #{name}) || puppet module install #{version} #{name} --modulepath=#{install_dir}"
end