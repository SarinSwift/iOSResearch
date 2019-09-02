import UIKit

// Here I'm going to list down 3 ways for implementing the singleton pattern in Swift

/* First Implementation: Defining a global variable
We can access the singleton object any where in the module, for example in the application(_:didFinishLaunchingWithOptions:)
method of the AppDelegate class
*/

let sharedNetworkManager = NetworkManager(baseURL: API.baseURL)

class NetworkManager {

    // MARK: - Properties
    let baseUrl: URL

    // MARK: - Initialization
    init(baseUrl: URL) {
        self.baseUrl = baseUrl
    }
}

// accessing the singleton
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    print(sharedNetworkManager)
    return true
}


/* Second: Using static property and private initializer
Getting the singleton object by calling a static property within the class. Accessing the singleton is intuitive and clearly conveys
that we're dealing with a singleton
*/

class NetworkManager {

    // MARK: - Properties

    static let shared = NetworkManager(baseURL: API.baseURL)

    let baseUrl: URL

    // MARK: - Initialization
    private init(baseUrl: URL) {
        self.baseUrl = baseUrl
    }
}

// accessing the singleton
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    print(NetworkManager.shared)
    return true
}

/* Third: Using a closure to instantiate the singleton object.
A more complex way of creating the singleton. You can see below that the sharedNetworkManager property is set to private. Leaving the singleton
objetc to be accessible through the shared() class method.
*/

class NetworkManager {

    // MARK: - Properties

    private static var sharedNetworkManager: NetworkManager = {
        let networkManager = NetworkManager(baseURL: API.baseURL)
        // TODO: Configuration added here
        return networkManager
    }()

    let baseUrl: URL

    // MARK: - Initialization
    private init(baseUrl: URL) {
        self.baseUrl = baseUrl
    }

    // MARK: - Accessories
    class func shared() -> NetworkManager {
        return sharedNetworkManager
    }
}

// accessing the singleton
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    print(NetworkManager.shared())
    return true
}
