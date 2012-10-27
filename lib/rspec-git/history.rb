module RspecGit
    class History

        def self.file_path
            "#{prefix}#{file_name}"
        end

        def self.file_name
            ".last_tdd_run"
        end

        def open
            @target ||= File.open(self.class.file_path, "w")
        end

        def file
            @target
        end

        def close
            @target.close
            @target = nil
        end

    private

        def self.prefix
            ("#{ENV['PWD']}" && "#{ENV['PWD']}/") || ""
        end

    end
end