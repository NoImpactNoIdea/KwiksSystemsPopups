Pod::Spec.new do |s|
  s.name             = 'KwiksSystemsPopups'
  s.version          = '0.1.2'
  s.summary          = 'KwiksSystemsPopups was designed to handle all internal card style popups in the Kwiks iOS Application.'

  s.description      = <<-DESC
  'KwiksSystemsPopups was designed to help support light frontend and easy code management solutions. The goal of this pod is to provide a one liner popup that switches the PopupType enum.'
                       DESC

  s.homepage         = 'https://github.com/26388491/KwiksSystemsPopups'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'KWIKS CTO' => 'charlie@kwiks.com' }
  s.source           = { :git => 'https://github.com/NoImpactNoIdea/KwiksSystemsPopups.git', :tag => s.version.to_s }

  s.ios.deployment_target = '15.0'
  s.swift_versions = "5.0"
  s.requires_arc = true

  s.source_files = 'KwiksSystemsPopups/Classes/**/*'
  s.resources = 'KwiksSystemsPopups/**/*.{lproj,storyboard,xcdatamodeld,xib,xcassets,json,ttf,otf}'
  s.frameworks = 'UIKit'
   
end
