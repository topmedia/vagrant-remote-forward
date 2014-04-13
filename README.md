# vagrant-remote-forward

As part of a chef-server push-setup, vagrant-remote-forward will, for 
example,  give you access to a proxy running on the machine you execute your
vagrant provisioning commands on, effectively allowing you to firewall off
permanent access to your chef server.

On a more general level, you can forward ports on the remote machine that it,
in and of itself, would not have access to otherwise.

## Installation

    vagrant plugin install vagrant-remote-forward

## Usage

Add your port forward configuration to your `Vagrantfile`:

    Vagrant.configure '2' do
      # ..
      config.remote_forward.add 5000, '192.168.1.1', 8000
    end

This will forward port `8000` on the VM to the host `192.168.1.1:5000` on 
your local network. (I know the syntax feels backwards, but this is what's
being used in [OpenSSH][] and I felt it'd be even more confusing to deviate from
that de-facto stanard.)

It will also work in a multi-vm environment:

    Vagrant.configure '2' do
      # ..
      config.vm.define 'A' do |a|
        a.remote_forward.add 5000, '192.168.1.1', 8000
      end

      config.vm.define 'B' do |b|
        a.remote_forward.add 6000, '192.168.1.10', 7000
      end
    end

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

[OpenSSH]: http://www.openbsd.org/cgi-bin/man.cgi?query=ssh&sektion=1
