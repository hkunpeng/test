Pod::Spec.new do |s|

  s.name         		= "EHFrameworks"
  s.version      		= "0.0.1"
  s.summary      		= "EHFrameworks"
  s.homepage     		= "premom.com"
  s.license	      		= { :type => 'MIT', :file => 'LICENSE' }
  s.author       		= { "lilei" => "developer.lilei@gmail.com" }
  s.source       		= { :git => "", :tag => s.version.to_s }

  s.vendored_frameworks 	= ["EHFrameworks/Frameworks/*.framework"]
  s.libraries = 'c++'

  s.ios.deployment_target 	= "11.0"

  s.frameworks = 'AVFoundation', 'CoreMedia'

end

