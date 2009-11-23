require 'yaml'
require 'detector'    
include UserAgentDetector

describe Detector do 
  
  before do
     @detector = Detector.new()
  end
  
  describe ".is_iphone_ipod?" do 
    
    it "should match for iPhone user-agent string" do
      user_agent_string = "Mozilla/5.0 (iPhone; U; CPU iPhone OS 3_0 like Mac OS X; en-us) AppleWebKit/420.1 (KHTML, like Gecko) Version/3.0 Mobile/1A542a Safari/419.3"
      @detector.match_agent_class?(user_agent_string,:iphone_ipod).class.should == MatchData
    end   
  
    it "should match iPod for ipod user-agent string" do
      user_agent_string = "Mozilla/5.0 (iPod; U; CPU iPhone OS 3_1_1 like Mac OS X; en-us) AppleWebKit/528.18 (KHTML, like Gecko) Mobile/7C145"
       @detector.match_agent_class?(user_agent_string,:iphone_ipod).class.should == MatchData
    end
  
    it "should NOT match for Windows Mozilla user-agent string" do
      user_agent_string = "Mozilla/5.001 (windows; U; NT4.0; en-US; rv:1.0) Gecko/25250101"
       @detector.match_agent_class?(user_agent_string,:iphone_ipod).should == nil
    end
  end
  
  describe ".is_android?" do
    it "should match for Android user-agent string" do
      user_agent_string = "Mozilla/5.0 (Linux; U; Android 1.5; en-za; HTC Hero Build/CUPCAKE)"
       @detector.match_agent_class?(user_agent_string,:android).class.should == MatchData
    end
    
    it "should NOT match iPod for ipod user-agent string" do
      user_agent_string = "Mozilla/5.0 (iPod; U; CPU iPhone OS 3_1_1 like Mac OS X; en-us) AppleWebKit/528.18 (KHTML, like Gecko) Mobile/7C145"
       @detector.match_agent_class?(user_agent_string,:android).should == nil
    end

    it "should NOT match for Windows Mozilla user-agent string" do
      user_agent_string = "Mozilla/5.001 (windows; U; NT4.0; en-US; rv:1.0) Gecko/25250101"
       @detector.match_agent_class?(user_agent_string,:android).should == nil
    end
    
  end
  
  describe ".is_major_mobile?" do
    it "should NOT match for Windows Mozilla user-agent string" do
      user_agent_string = "Mozilla/5.001 (windows; U; NT4.0; en-US; rv:1.0) Gecko/25250101"
       @detector.match_agent_class?(user_agent_string,:major_mobile).should == nil
    end
    
    it "should match for Windows CE user-agent string" do
      user_agent_string = "HTC-8500/1.2 Mozilla/4.0 (compatible; MSIE 5.5; Windows CE; PPC; 240x320)"
       @detector.match_agent_class?(user_agent_string,:major_mobile).class.should == MatchData
    end

    it "should match for user-agent string containing Mobile" do
      user_agent_string = "Mozilla/5.0 (iPod; U; CPU iPhone OS 3_1_1 like Mac OS X; en-us) AppleWebKit/528.18 (KHTML, like Gecko) Mobile/7C145"
      @detector.match_agent_class?(user_agent_string,:major_mobile).class.should == MatchData
    end
    
    it "should match for user-agent string containing blackeberry" do
      user_agent_string = "BlackBerry7100i/4.1.0 Profile/MIDP-2.0 Configuration/CLDC-1.1 VendorID/103"
      @detector.match_agent_class?(user_agent_string,:major_mobile).class.should == MatchData
    end
    
  end
  
end
