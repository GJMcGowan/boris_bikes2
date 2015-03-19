require 'bike'
describe Bike do
  it { is_expected.to respond_to :broken? }
  context 'when created' do
    it { is_expected.not_to be_broken }
  end
  it 'can break' do
    subject.break
    expect(subject).to be_broken
  end
end
