require 'spec_helper'

module Tagit
  describe Version do
    describe ".new" do
      context "project-conventional inputs" do
        context "Major/minor" do
          subject { Version.from_s('v0.1') }

          its(:major) { should eql(0) }
          its(:minor) { should eql(1) }
          its(:patch) { should be_nil }
          its(:to_s) { should eql('v0.1') }
        end

        context "Major/minor/patch" do
          subject { Version.from_s('v0.1.2') }

          its(:major) { should eql(0) }
          its(:minor) { should eql(1) }
          its(:patch) { should eql(2) }
          its(:to_s) { should eql('v0.1.2') }
        end
      end

      context "unconventional inputs" do
        it "should raise ArgumentError" do
          [nil, 'vv0.1', 'production_29345345341', '', ' '].each do |str|
            lambda { Version.new(str) }.should raise_error(ArgumentError)
          end
        end
      end
    end

    describe "Comparison" do
      specify "Version should be bigger than nil" do
        Version.from_s('v0.0').should > nil
      end

      specify "Version 10 should be bigger than version 2" do
        Version.from_s('v10.1.2').should > Version.from_s('v2.1.2')
      end

      specify "versions should be equal" do
        Version.from_s('v0.1.2').should == Version.from_s('v0.1.2')
      end

      specify "versions with bigger minor should win" do
        Version.from_s('v0.2.2').should > Version.from_s('v0.1.45')
      end

      specify "version 0.9.1 should be bigger than 0.9" do
        Version.from_s('v0.9.1').should > Version.from_s('v0.9')
      end

      specify "version 0.9 should be smaller than 0.9.1" do
        Version.from_s('v0.9').should < Version.from_s('v0.9.1')
      end
    end

    describe ".current" do
      before { Version.stub(:git_tags).and_return("v0.1\nv0.2\nv0.3\nproduction_things") }
      subject { Version.current }

      its(:major) { should eql(0) }
      its(:minor) { should eql(3) }
      its(:patch) { should be_nil }
    end
  end
end