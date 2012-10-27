module RspecGit
    class Command
        def self.run(command, args)
            RspecRunner.new.run
            Commiter.new.create
        end
    end
end