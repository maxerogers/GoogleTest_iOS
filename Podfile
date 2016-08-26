# Uncomment this line to define a global platform for your project
# platform :ios, '9.0'

def datamanagement_pods
    pod 'Alamofire'
    pod 'AlamofireObjectMapper'
    pod 'ObjectMapper'
    pod 'SwiftyJSON'
end


target 'GoogleCalendarTest' do
  # Comment this line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for GoogleCalendarTest
  pod 'GoogleAPIClient/Calendar'
  pod 'GTMOAuth2'
  datamanagement_pods
end

target 'GoogleCalendarTestTests' do
  use_frameworks!
  
  pod 'Quick'
  pod 'Nimble'
  datamanagement_pods
end

#target 'GoogleCalendarTest_tvOS' do
#    # Comment this line if you're not using Swift and don't want to use dynamic frameworks
#    use_frameworks!
#    
#    # Pods for GoogleCalendarTest
#    pod 'GoogleAPIClient/Calendar'
#    pod 'GTMOAuth2'
#end
