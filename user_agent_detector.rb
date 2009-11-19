class UserAgentDetector 
  
    attr_reader :patterns
                            
    #hash of patterns to be loaded in via Yaml or however you see fit.
    def initialize(patterns)
       @patterns =  patterns
    end

    def match_agent_class?(user_string,type)
      Regexp.new(patterns[type],Regexp::IGNORECASE).match(user_string)
    end      
end