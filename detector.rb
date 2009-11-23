module UserAgentDetector

  class Detector
    require 'yaml'
    
    attr_reader :patterns
    
    def initialize(pattern_file="#{File.dirname(__FILE__)}/conf/agent_classes.yml") 
      @patterns = YAML::load(File.open(pattern_file))
      # @detector = Matcher.new(pattern_file || YAML::load(File.open("#{File.dirname(__FILE__)}/conf/agent_classes.yml")))      
    end 
    
    def match_agent_class?(user_string,type)
        Regexp.new(@patterns[type],Regexp::IGNORECASE).match(user_string)
    end
     
    
    def is_iphone_ipod?(user_string)
      !match_agent_class?(user_string,:iphone_ipod).nil?
    end

    def is_android?(user_string)
      !match_agent_class?(user_string,:android).nil?
    end

    def is_major_mobile?(user_string)
      !match_agent_class?(user_string,:major_mobile).nil? 
    end 
    
  end

end