module Octokit
  class Client
    module Milestones

      # List milestones for a repository
      #
      # @param repository [String, Repository, Hash] A GitHub repository.
      # @param options [Hash] A customizable set of options.
      # @option options [Integer] :milestone Milestone number.
      # @option options [String] :state (open) State: <tt>open</tt> or <tt>closed</tt>.
      # @option options [String] :sort (created) Sort: <tt>created</tt>, <tt>updated</tt>, or <tt>comments</tt>.
      # @option options [String] :direction (desc) Direction: <tt>asc</tt> or <tt>desc</tt>.
      # @return [Array] A list of milestones for a repository.
      # @see http://developer.github.com/v3/issues/milestones/#List-Milestones-for-an-Issue
      # @example List milestones for a repository
      #   Octokit.list_milestones("sferik/rails_admin")
      def list_milestones(repository, options={})
        get("/repos/#{Repository.new(repository)}/milestones", options, 3)
      end
      alias :milestones :list_milestones

      def create_milestone(repository, title, options={})
        post("/repos/#{Repository.new(repository)}/milestones", options.merge({:title => title}), 3)
      end

    end
  end
end
