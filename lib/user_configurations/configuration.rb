require 'active_support/core_ext/hash/indifferent_access'

module UserConfigurations
  class Configuration < SimpleDelegator
    attr_accessor :project_name

    def initialize(project_name)
      @project_name = project_name
      super global.merge(user).merge(environment).with_indifferent_access
    end

    def store(values)
      File.write user_file, YAML.dump(user.merge(values))
      merge! values
    end

    private

    def global
      load global_file
    end

    def user
      load user_file
    end

    def user_file
      File.expand_path File.join('~', ".#{project_name}")
    end

    def global_file
      File.join('/', 'etc', project_name)
    end

    def load(file)
      File.file?(file) ? YAML.load_file(file) : {}
    end

    def environment
      ENV
    end
  end
end
