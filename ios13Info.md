## iOS 13
Some new features and tools that are coming out for iOS 13!!     
References: hackingwithswift.com

### Swift UI
A new way for designing apps. SwiftUI uses a ***declarative way*** and before hand, we were using the imperative way. Declarative UI lets us tell the app all the possible states of our app at once. For example: If a user is logged in, show a welcome message, but if user is logged out, show a login message. We won’t need to write code to switch between these 2 states.  
Instead, SwiftUI switches between states of UI layouts for when the state changes. And updates the UI based on our behalf. And that’s what declarative means: we’re directly telling it all the rules we want it to follow and trusting SwiftUI to make sure those rules are enforced.  
Another bonus of SwiftUI is it acts as a ***cross platform UI layout*** for iOS, macOS, tvOS, and watchOS. This means you can only learn 1 language and layout framework, then deploy your code anywhere.


### UIKit: Dark Mode, macOS
Offers an easy way to port iOS apps to macOS. ***Project Catalyst*** which is as simple as checking the box that adds macOS as a target for iOS apps.  
Provides dark mode but you must ensure that the UI looks good on both backgrounds. This can be done by providing a light and dark alternative color if you’re using custom colors using the custom asset catalog appearance box. iOS 13 adds a new way to adapt semantic colors based on the users trait environment.

### Multi Window Support
App delegate has split up in 2: AppDelegate.swift and SceneDelegate.swift. This is supported for apps on the iPad and it effectively splits the work of app delegate in two.  
Here is what the ***app delegate*** should do iOS 13 onward:  
- Set up data that you need for the duration of the app
- Respond to any events that focus on the app, such as files sent to you.  
- Register external services such as push notifications
- Configure initial scenes.  

On the other hand, ***scene delegate*** only handles 1 instance of your apps UI. So if the user creates 2 windows(showing your app), you have 2 scenes. Both backed by the same app delegate.
Note that scenes work independently. So the application doesn’t go in background mode, only the individual scene does! And another note is users might move one to the background while keeping another open.

### Haptic Customization
New Core Haptics framework. Lets us control how the Taptic engine generates vibrations. Even more impressively, the haptic system can be given sounds to play along side vibrations and both will be synchronized.

### VisionKit
Lets us scan documents quickly. Its sole job is to present a view controller for document scanning then reading back what it found.

### CoreImage
CoreImage is safer with actual compiler enforced types instead of strings.
