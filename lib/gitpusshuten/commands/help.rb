module GitPusshuTen
  module Commands
    class Help < GitPusshuTen::Commands::Base
      description "Displays the command list, or the help screen for a specific command."
      usage       "gitpusshuten help | gitpusshuten help <command>"
      example     "gitpusshuten help | gitpusshuten help tag"

      ##
      # Help specific attributes/arguments
      attr_accessor :command

      ##
      # Initializes the Help command
      def initialize(*objects)
        super
        
        @command = cli.arguments.shift
      end

      ##
      # Performs the Help command
      def perform!
        if command.nil?
          command_object.display_commands
        else
          if command_object.available_commands.include?(command)
            command_object.display_usage(command)
          else
            GitPusshuTen::Log.error "Command <#{command}> not found."
          end
        end
      end
      
    end
  end
end