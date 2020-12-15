# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'SoccerNoteApp' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for SoccerNoteApp

  target 'SoccerNoteAppTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'SoccerNoteAppUITests' do
    # Pods for testing
  end

  # add the Firebase pod for Google Analytics
  pod 'Firebase/Analytics'
  # add pods for any other desired Firebase products
  # https://firebase.google.com/docs/ios/setup#available-pods

  pod 'IQKeyboardManagerSwift'

end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '9.0'
    end
  end
end
