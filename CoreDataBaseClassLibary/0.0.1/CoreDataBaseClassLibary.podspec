Pod::Spec.new do |s|
  s.name         = "CoreDataBaseClassLibary"
  s.version      = "0.0.1"
  s.summary      = "Example of coreData Base Library."
  s.homepage     = "https://github.com/albertvc10/CoreDataBaseClassLibrary"
  s.license      = 'MIT'
  s.author       = "Albert Villanueva"
  s.source       = { :git => "https://github.com/albertvc10/CoreDataBaseClassLibrary.git", :tag => "0.0.1" }
  s.platform     = :ios, '7.0'
s.source_files = '*.{h,m}'
  s.frameworks   = 'CoreData'
  s.requires_arc = true
#  s.social_media_url = ''
# s.dependency 'UIColor+FlatColors'
end
