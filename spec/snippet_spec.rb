require File.dirname(__FILE__) + '/spec_helper'

describe ContentBlocks::Snippet do
  before do
    @valid_attributes = {
      :label => "sidebar",
      :content => "h1. Sidebar links"
    }
    @snippet = ContentBlocks::Snippet.new(@valid_attributes)
  end  

  it "should be initially draft" do
    @snippet.save!
    @snippet.draft?.should be_true
  end

  it "should be unique when published" do
    @snippet.save!
    cloned = ContentBlocks::Snippet.create!(@valid_attributes)
    @snippet.publish!
    @snippet.should be_valid
    @snippet.published?.should be_true
    cloned.publish!
    cloned.published?.should be_false
    @snippet.preview!
    cloned.publish!
    cloned.published?.should be_true
    @snippet.publish!
    @snippet.published?.should be_false
  end

  it "should require label" do
    @snippet.label = nil
    @snippet.should_not be_valid
  end

  it "should require valid label" do
    @snippet.label = "abc_123_AZ"
    @snippet.should be_valid
    @snippet.label = "1-2-3"
    @snippet.should have(1).error_on(:label)
  end

  context "#raw_content" do
    it "should show content only if published" do
      @snippet.save!
      @snippet.raw_content.should be_nil
      @snippet.publish!
      @snippet.raw_content.should_not be_nil
    end
  
    it "should preserve unformatted content" do
      @snippet.save!
      @snippet.publish!
      @snippet.raw_content.should == @valid_attributes[:content]
    end
  end

  context "#content" do
    it "should show content only if published" do
      @snippet.save!
      @snippet.content.should be_nil
      @snippet.publish!
      @snippet.content.should_not be_nil
    end

    it "should textilize content" do
      @snippet.save!
      @snippet.publish!
      @snippet.content.should == "<h1>Sidebar links</h1>"
    end
  end
end
