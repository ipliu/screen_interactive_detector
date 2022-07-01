#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint screen_interactive_detector.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'screen_interactive_detector'
  s.version          = '1.0.0'
  s.summary          = 'Flutter Plugin to detect if device is in lock screen. Useful for determining whether app entered background due to locking screen or leaving app.'
  s.description      = <<-DESC
Flutter Plugin to detect if device is in lock screen. Useful for determining whether app entered background due to locking screen or leaving app.
                       DESC
  s.homepage         = 'http://example.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'email@example.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.dependency 'Flutter'
  s.platform = :ios, '9.0'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'
end
