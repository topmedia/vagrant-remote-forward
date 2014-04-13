module VagrantPlugins
  module RemoteForward
    class Config < Vagrant.plugin(2, :config)
      Forward = Struct.new(:port, :host, :remoteport)

      attr_accessor :add, :forwards

      def initialize
        @forwards = []
        # @widgets = UNSET_VALUE
      end

      def add(port, host, remoteport)
        forwards << Forward.new(port, host, remoteport)
      end

      def finalize!
        # @widgets = 0 if @widgets == UNSET_VALUE
      end
    end
  end
end
