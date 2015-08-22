
Pod::Spec.new do |s|
  s.name             = "JTSBGTask"
  s.version          = "1.0"
  s.summary          = "Tidily request background task time on iOS."
  s.description      = "Tidily request background task time on iOS. I'm adding additional words here to satisy CocoaPods' pedantry."
  s.homepage         = "https://github.com/jaredsinclair/JTSBGTask"
  s.license          = 'MIT'
  s.author           = { "Jared Sinclair" => "jaredsinclair.rn@gmail.com" }
  s.source           = { :git => "https://github.com/jaredsinclair/JTSBGTask.git", :tag => s.version.to_s }

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.frameworks = 'Foundation', 'UIKit'
  s.source_files = 'JTSBGTask.swift'
end
