public struct ColorschemeDefault {
    static let store = UserDefaults.standard
    private static let colorschemeKey = "BoardColor.key"
    
    static var defaultColorscheme = "sky"
    
    public static var boardColorString: String? {
        get {
            store.string(forKey: colorschemeKey) ?? defaultColorscheme
        }
        
        set {
            store.set(newValue, forKey: colorschemeKey)
        }
    }
}
