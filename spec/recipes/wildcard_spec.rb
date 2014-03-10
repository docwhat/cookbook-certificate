require 'spec_helper'

describe 'certificate::wildcard', :encrypted_data_bag do
  let(:fake_data_bag) do
    {
      'key' => 'The Key',
      'cert' => 'The Certificate',
      'chain' => 'The Intermediate Certificates'
    }
  end

  subject(:chef_run) do
    ChefSpec::Runner
      .new(step_into: ['certificate'])
      .converge(described_recipe)
  end

  describe 'the recipe' do
    it 'creates the cert_file wildcard.pem' do
      expect(chef_run)
        .to create_certificate_manage('wildcard')
        .with(cert_file: 'wildcard.pem')
    end

    it 'creates the key_file wildcard.key' do
      expect(chef_run)
        .to create_certificate_manage('wildcard')
        .with(key_file: 'wildcard.key')
    end

    it 'creates the chain_file wildcard-bundle.crt' do
      expect(chef_run)
        .to create_certificate_manage('wildcard')
        .with(chain_file: 'wildcard-bundle.crt')
    end
  end

  describe 'the LWRP' do
    it 'narf' do
      expect(chef_run)
        .to create_template('fish')
    end
  end
end
