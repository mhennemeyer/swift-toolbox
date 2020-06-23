public protocol Composable {
    var configureChildren: () -> Void { get set }
}
