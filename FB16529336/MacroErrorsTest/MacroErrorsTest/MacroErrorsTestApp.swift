import SwiftUI
import Dependencies
import DependenciesMacros

@main
struct MacroErrorsTestApp: App {
    @Dependency(MyDependency.self) var dependency

    var body: some Scene {
        WindowGroup {
            Button("Test", action: test)
        }
    }

    func test() {
        dependency.handle(string: "Test")
    }
}

@DependencyClient
public struct MyDependency: DependencyKey {
    public static let testValue = Self(handle: { _ in })

    public static let liveValue = Self(handle: { print("Handle", $0) })

    public var handle: (_ string: String) -> Void
}
