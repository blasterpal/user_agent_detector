# bowling_spec.rb        
require 'yaml'
require 'user_agent_detector' 

describe UserAgentDetector do 
  
  before do
     @detector = UserAgentDetector.new(YAML::load(File.open("conf/agent_classes.yml")))
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
end
