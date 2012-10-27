module RspecGit
    class Commiter
        def initialize
            @repository = Grit::Repo.new(".")
        end

        def create
            @repository.commit_all(message)
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
            commit_message
        end

        def diff_chunks
            @repository.diff("", "HEAD", History.file_path)
        end

        def add
            @repository.add(".")
        end
    end
end