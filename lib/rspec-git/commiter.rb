module RspecGit
    class Commiter
        def initialize
            @repository = Grit::Repo.new(".")
            self
        end

        def create
            add
            commit
        end

    private

        def message
            commit_message = ""
            diff_chunks.each do |chunk|
                chunk.diff.each_line do |line|
                    if line =~ /^[+]{1}[^+]+/
                        commit_message += line.downcase!.gsub!(/^\+/, "Added ")
                    end
                    if line =~ /^[-]{1}[^-]+/
                        commit_message += line.downcase!.gsub!(/^\-/, "Removed ")
                    end
                end
            end
            if commit_message == ""
                puts "There is no new specification. Didn't make commit..."
            else
                puts commit_message
            end
            commit_message
        end

        def diff_chunks
            @repository.diff("", "HEAD", History.file_name)
        end

        def add
            @repository.add(".")
        end

        def commit
            @repository.commit_all(message)
        end
    end
end