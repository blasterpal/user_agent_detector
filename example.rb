require 'yaml'
require 'user_agent_detector'

agent_detector = UserAgentDetector.new(YAML::load(File.open("conf/agent_classes.yml")))

  
def is_iphone_ipod?(user_string)
      agent_detector.match_agent_class?(user_string,:iphone_ipod)
end

def is_android?(user_string)
      agent_detector.match_agent_class?(user_string,:android) 
end   
