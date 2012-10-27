module RspecGit
    class RspecRunner

        def initialize
            @config = RSpec.configuration
            @history = History.new
        end

        def run
            open_history
            @config.instance_variable_set(:@reporter, RSpec::Core::Reporter.new(documentation_formatter, custom_formatter))
            RSpec::Core::Runner.run(['spec'], $stderr, $stdout)
            close_history
        end

    private

        def open_history
            @history.open
        end

        def close_history
            @history.close
        end

        def custom_formatter
            OnelineFormatter.new(@history.file)
        end

        def documentation_formatter
            @config.send(:built_in_formatter, :documentation).new(@config.output)
        end

    end
end