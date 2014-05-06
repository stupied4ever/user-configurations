require 'spec_helper'

module UserConfigurations
  describe Configuration do
    subject(:configuration) { Configuration.new project_name }

    let(:project_name) { 'some-fake-project' }

    let(:register_environment) { ENV[key] = 'environment' }
    let(:register_user) { register user_file, key => 'user' }
    let(:register_global) { register global_file, key => 'global' }

    let(:user_file) { File.expand_path(File.join('~', ".#{ project_name }")) }
    let(:global_file) { File.join('/', 'etc', project_name) }

    let(:key) { 'KEY' }

    before do
      ENV.delete key
      allow(File).to receive(:file?).with(user_file).and_return(false)
      allow(File).to receive(:file?).with(global_file).and_return(false)
    end

    it 'fetches from environment variables first' do
      register_environment
      register_user
      register_global
      expect(configuration[key]).to eq('environment')
    end

    it "fetches from user configuration file in `$HOME/.project' second" do
      register_user
      register_global
      expect(configuration[key]).to eq('user')
    end

    it "fetches from global configuration file in `/etc/project' third" do
      register_global
      expect(configuration[key]).to eq('global')
    end

    describe '#store' do
      subject(:store) { configuration.store values }

      let(:values) { { other_key => other_value } }
      let(:other_key) { 'OTHER_KEY' }
      let(:other_value) { 'other_value' }

      it "stores values in user configuration file in `$HOME/.project'" do
        expect(File).to receive(:write).with(user_file, YAML.dump(values))
        store
      end

      it 'keeps the contents of user configuration file' do
        register_user
        expect(File).to receive(:write)
          .with(user_file, YAML.dump({ key => 'user' }.merge(values)))
        store
      end

      it 'fetches the new stored values' do
        allow(File).to receive(:write)
        store
        expect(configuration.fetch other_key).to eq(other_value)
      end
    end

    def register(file, contents)
      allow(File).to receive(:file?).with(file).and_return(true)
      allow(YAML).to receive(:load_file).with(file).and_return(contents)
    end
  end
end
