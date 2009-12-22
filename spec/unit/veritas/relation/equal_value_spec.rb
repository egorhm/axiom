require File.expand_path('../../../../spec_helper', __FILE__)

describe 'Veritas::Relation#==' do
  before do
    @header = [ [ :id, Integer ] ]

    @relation = Relation.new(@header, [ [ 1 ] ])
  end

  subject { @relation == @other }

  describe 'with equivalent relations' do
    before { @other = @relation.dup }

    it { should be_true }
  end

  describe 'with different relations' do
    before { @other = Relation.new(@header, [ [ 2 ] ]) }

    it { should be_false }
  end
end
