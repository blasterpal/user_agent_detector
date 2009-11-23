require 'yaml'
require 'detector'    
# require 'matcher'
include UserAgentDetector

@agent_detector = Detector.new()

  


puts "Is Ipod: #{@agent_detector.is_iphone_ipod?('Mozilla/5.0 (iPhone; U; CPU iPhone OS 3_0 like Mac OS X; en-us) AppleWebKit/420.1 (KHTML, like Gecko) Version/3.0 Mobile/1A542a Safari/419.3')}"     


puts "Is Ipod: #{@agent_detector.is_android?('Mozilla/5.0 (Linux; U; Android 1.5; en-za; HTC Hero Build/CUPCAKE)')}"       
