module VagrantPlugins
  module RemoteForward
    class Plugin < Vagrant.plugin('2')
      name "Vagrant Remote Forward"

      config "remote_forward" do
        require_relative "config"
        Config
      end

      action_hook :setup_remote_forward do |hook|
        require_relative 'setup'

        if defined?(VagrantPlugins::ProxyConf)
          require 'vagrant-proxyconf/action/configure_env_proxy'
          hook.after VagrantPlugins::ProxyConf::Action::ConfigureEnvProxy,
            VagrantPlugins::RemoteForward::Setup
        else
          hook.before :run_provisioner, VagrantPlugins::RemoteForward::Setup
        end
      end

    end
  end
end
