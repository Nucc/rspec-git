require "rspec"
require 'rspec/core/formatters/base_formatter.rb'

module RspecGit
    class OnelineFormatter < RSpec::Core::Formatters::BaseFormatter
        def output
            examples.each do |example|
                context = ""
                tmp_example = example.metadata
                while tmp_example[:example_group]
                    context = tmp_example[:example_group][:description_args].join(" ") + " " + context
                    tmp_example = tmp_example[:example_group]
                end

                testcase = example.metadata[:description_args].join(" ")
                @output.puts context.to_s + testcase.to_s
            end
        end
    end
end