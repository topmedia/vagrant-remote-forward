module VagrantPlugins
  module RemoteForward
    class Setup
      def initialize(app, env)
        @app = app
      end

      def call(env)
        if forwards = env[:machine].config.remote_forward.forwards
          # TODO: Find a public API for this instead of relying on protected
          # methods
          env[:machine].communicate.send(:connect) do |ssh|
            forwards.each do |f|
              env[:ui].info "Adding remote forward for #{f.remoteport} forwarding to #{f.host}:#{f.port}"
              ssh.forward.remote f.port, f.host, f.remoteport
            end
          end
        end
        @app.call env
      end
    end
  end
end
