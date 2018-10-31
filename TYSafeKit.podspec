

Pod::Spec.new do |s|


  s.name         = "TYSafeKit"
  s.version      = "0.0.1"
  s.summary      = "A short description of TYSafeKit. "

  s.description  = <<-DESC
    A Array or MutableArray safe kit for iOS platform,
 DESC

  s.homepage     = "http://localhost/TYSafeKit"


 s.license      = "MIT"


  s.author             = { "liyongqiang" => "1184954731@qq.com" }


 s.platform     = :ios, "8.0"


  s.source       = { :git => "git@localhost/TYSafeKit.git", :tag => s.version.to_s }


  # ――― Source Code ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  CocoaPods is smart about how it includes source code. For source files
  #  giving a folder will include any swift, h, m, mm, c & cpp files.
  #  For header files it will include any header in the folder.
  #  Not including the public_header_files will make all headers public.
  #

 # s.source_files  = "TYSafeKit/Classes", "TYSafeKit/Classes/**/*.{h,m}"
 # s.exclude_files = "Classes/Exclude"

 # s.public_header_files = "TYSafeKit/Classes/NSArray+SafeKit.h"
  s.subspec 'safeCore' do |ss|
      ss.source_files = ['TYSafeKit/Classes/safeCore/**/*.{h,m}*']
      ss.public_header_files = ['TYSafeKit/Classes/safeCore/**/*.h']
  end
  s.subspec 'Foundation' do |ss|
      ss.source_files = ['TYSafeKit/Classes/Foundation/**/*.{h,m}*','TYSafeKit/Classes/MRC/**/*.{h,m}*','TYSafeKit/Classes/Public/**/*.{h,m}*']
      ss.public_header_files = ['TYSafeKit/Classes/Public/**/*.h']
  end

  s.framework  = "Foundation"
  # s.frameworks = "SomeFramework", "AnotherFramework"

  # s.library   = "iconv"
  # s.libraries = "iconv", "xml2"



  s.requires_arc = true


end
