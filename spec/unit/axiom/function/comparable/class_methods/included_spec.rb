# encoding: utf-8

require 'spec_helper'

describe Function::Comparable, '.included' do
  subject { object }

  let(:object) { described_class }
  let(:klass)  { Class.new       }

  it 'extends the klass' do
    klass.singleton_class.should_not include(described_class::ClassMethods)
    klass.send(:include, subject)
    klass.singleton_class.should include(described_class::ClassMethods)
  end

  it 'delegates to the ancestor' do
    included_ancestor = false
    mod = Module.new do
      define_method(:included) { |_| included_ancestor = true }
    end
    subject.extend mod
    expect { klass.send(:include, subject) }
      .to change { included_ancestor }.from(false).to(true)
  end
end
