# encoding: utf-8

module GithubCLI
  class Commands::Milestones < Command

    namespace :milestone

    desc 'list <user> <repo>', 'List milestones for a repository'
    long_desc <<-DESC
      Parameters

        state - open, closed, default: open\n
        sort - due_date, completeness, default: due_date\n
        direction - asc, desc, default: desc\n
    DESC
    def list(user, repo)
      Milestone.all user, repo, options[:params], options[:format]
    end

    desc 'get <user> <repo> <id>', 'Get a single milestone'
    def get(user, repo, id)
      Milestone.get user, repo, id, options[:params], options[:format]
    end

    desc 'create <user> <repo>', 'Create a milestone'
    long_desc <<-DESC
      Parameters

        title - Required string\n
        state - Optional string - open or closed\n
        description - Optional string\n
        due_on - Optional string - ISO 8601 time\n
    DESC
    def create(user, repo)
      Milestone.create user, repo, options[:params], options[:format]
    end

    desc 'update <user> <repo> <id>', 'Update a milestone'
    long_desc <<-DESC
      Parameters

        title - Required string\n
        state - Optional string - open or closed\n
        description - Optional string\n
        due_on - Optional string - ISO 8601 time\n
    DESC
    def upload(resource, filename)
      Download.upload resource, filename, options[:format]
    end

    desc 'delete <user> <repo> <id>', 'Delete a milestone'
    def delete(user, repo, id)
      Milestone.delete user, repo, id, options[:params], options[:format]
    end

  end # Milestones
end # GithubCLI
