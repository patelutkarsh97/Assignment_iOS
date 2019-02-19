import UIKit

var str = "Hello, playground"
/*:
 # Session : iOS : Getting Started with iOS, Swift and Coding guidelines
 
 
 
 ## 1. Explain what is Xcode?
 
 ### Xcode is an integrated development environment (IDE) for macOS containing a suite of software development tools developed by Apple for developing software for macOS, iOS, watchOS, and tvOS.
 
 
 
 ## 2. Explain how you can add frameworks in Xcode project?
 
 
 ### To add the framework follow this step Go to Project Settings > General > Linked Frameworks and  Libraries > '+' and then select the framework from the list.                To include a framework in our Xcode project, choose Project > Add to Project and select the framework directory. Alternatively, we can control-click your project group and choose Add Files > Existing Frameworks from the contextual menu. When we add an existing framework to our project, Xcode asks us to associate it with one or more targets in our project. Once associated, Xcode automatically links the framework against the resulting executable.
 
 
 ## 3. Explain what is the difference between Xcode, Cocoa and Objective C?
 
 ### Xcode: - Xcode is an integrated development environment (IDE) for macOS containing a suite of software development tools developed by Apple for developing software for macOS, iOS, watchOS, and tvOS.
 ### "It is the integrated development environment (IDE) that developer use to write software for IOS or OS X."
 
 ### Cocoa: - Cocoa Touch is a UI framework for building software programs to run on iOS for the iPhone, iPod Touch, and iPad, watchOS for the Apple Watch, and tvOS for the fourth-generation Apple TV, from Apple Inc. Cocoa Touch provides an abstraction layer of iOS, the operating system for the iPhone, iPod Touch, and iPad.
 ### "It is the application"
 
 ### Objective C: - Objective-C is a general-purpose, object-oriented programming language that adds Smalltalk-style messaging to the C programming language. This is the main programming language used by Apple for the OS X and iOS operating systems and their respective APIs, Cocoa and Cocoa Touch.
 ### "It is the language most preferred by developer to write programs for apple"
 
 ## 4. What is the short cut to open the “Code Snippet Library” in Xcode?
 
 ### The shortcut to open the "Code Snippet Library" is just by pressing [Command] + [Option] + [Shift] + [L]
 
 ## 5. Mention what are the build phases available in Xcode?
 
 ### We can configure different build phases to perform tasks when building a target.
 
 ### To view the build phases, open the project editor and click Build Phases. To add a build phases that doesn’t appear in the editor, click the Add button (+) and choose a build phase from the pop-up menu.
 
 ### The build phases available in Xcode are:
 * Compile sources
 * Copy bundle resources
 * Copy files
 * Headers
 * Link binary with libraries
 * Run script
 * Target dependencies
 
 ## 6. Explain how app delegate is declared by Xcode project templates?
 
 ### App delegate is defined as a sub-class of UIResponder by Xcode project templates.
 
 ## 7. Explain how you define variables in Swift language?
 
 ###  We can define variable in Swift language by using the "var" kerword.
 Syntax: var variableName = <value>
 
 ## 8. What is interface builder?
 
 ### Interface Builder is a software development application for Apple's macOS operating system. It is part of Xcode (formerly Project Builder), the Apple Developer developer's toolset. Interface Builder allows Cocoa and Carbon developers to create interfaces for applications using a graphical user interface, it is easy to independently design our interfaces, separate from their implementations.
 
 ## 9. List devices and their resolutions, screen size has iOS as their OS.
 
 ###
 --
 * iPhone X    1125 x 2436 (Resolution in pixels)  375 x 812 (UIKit Size in points)
 * iPhone 8 Plus   1080 x 1920 (Resolution in pixels)  414 x 736 (UIKit Size in points)
 * iPhone 8    750 x 1334 (Resolution in pixels)  375 x 667 (UIKit Size in points)
 * iPhone 7 Plus    1080 x 1920 (Resolution in pixels)  414 x 736 (UIKit Size in points)
 * iPhone 6s Plus    1080 x 1920 (Resolution in pixels)  375 x 667 (UIKit Size in points)
 * iPhone 6 Plus    1080 x 1920 (Resolution in pixels)  375 x 667 (UIKit Size in points)
 * iPhone 7   750 x 1334 (Resolution in pixels)  375 x 667 (UIKit Size in points)
 * iPhone 6s     750 x 1334 (Resolution in pixels)  375 x 667 (UIKit Size in points)
 * iPhone 6      750 x 1334 (Resolution in pixels)  375 x 667 (UIKit Size in points)
 * iPhone SE    640 x 1136 (Resolution in pixels)  320 x 568 (UIKit Size in points)
 * iPad Pro 12.9-inch (2nd generation)    2048 x 2732 (Resolution in pixels)  1024 x 1366 (UIKit Size in points)
 * iPad Pro 10.5-inch    2224 x 1668 (Resolution in pixels)  1112 x 834 (UIKit Size in points)
 * iPad Pro (12.9-inch)    2048 x 2732 (Resolution in pixels)  1024 x 1366 (UIKit Size in points)
 * iPad Pro (9.7-inch)    1536 x 2048 (Resolution in pixels)  768 x 1024 (UIKit Size in points)
 * iPad Air 2    1536 x 2048 (Resolution in pixels)  768 x 1024 (UIKit Size in points)
 * iPad Mini 4    1536 x 2048 (Resolution in pixels)  768 x 1024 (UIKit Size in points)
 */
