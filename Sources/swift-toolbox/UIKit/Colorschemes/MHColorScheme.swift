#if !os(macOS)
import UIKit

public struct MHColorScheme: Equatable {
    
    var backgroundColor: UIColor
    var textColor: UIColor
    var sectionColor: UIColor
    var name: String
    
    init(backgroundColor: UIColor, textColor: UIColor, sectionColor: UIColor, name: String) {
        self.backgroundColor = backgroundColor
        self.textColor = textColor
        self.sectionColor = sectionColor
        self.name = name
    }
    
    // MARK: - Coding
    
    enum CodingKeys: String, CodingKey {
        case backgroundColor
        case textColor
        case sectionColor
        case name
    }
    
    // MARK: - Equatable
    
    public static func ==(lhs: MHColorScheme, rhs: MHColorScheme) -> Bool {
        return lhs.name == rhs.name
    }
    
    // MARK: - Access
    
    static func colorSchemeBy(name: String) -> MHColorScheme {
        for scheme in allColorSchemes {
            if scheme.name == name {
                return scheme
            }
        }
        fatalError()
    }
    
    static let allColorSchemes = grayMHColorSchemes + redMHColorSchemes + greenMHColorSchemes + blueMHColorSchemes
    
    static let colorfulColorSchemes = redMHColorSchemes + greenMHColorSchemes + blueMHColorSchemes
    
    static func colorSchemes(at section: Int) -> [MHColorScheme] {
        let schemes = MHColorSchemeSections[section]["MHColorSchemes"] as! [MHColorScheme]
        return schemes
    }
    
    static func sectionName(at section: Int) -> String {
        let name = MHColorSchemeSections[section]["SectionName"] as! String
        return name
    }
    
    static func sectionColor(at section: Int) -> UIColor {
        let color = MHColorSchemeSections[section]["SectionColor"] as! UIColor
        return color
    }
    
    static let MHColorSchemeSections = [
        ["MHColorSchemes": grayMHColorSchemes, "SectionColor": graySectionColor, "SectionName":"Gray Schemes"],
        ["MHColorSchemes": redMHColorSchemes, "SectionColor": redSectionColor, "SectionName":"Red Schemes"],
        ["MHColorSchemes": greenMHColorSchemes, "SectionColor": greenSectionColor, "SectionName":"Green Schemes"],
        ["MHColorSchemes": blueMHColorSchemes, "SectionColor": blueSectionColor, "SectionName":"Blue Schemes"]
    ]
    
    static let grayMHColorSchemes = [licorice, lead, tungsten, iron, steel, tin, nickel, aluminum, magnesium, silver, mercury, snow]
    static let graySectionColor = UIColor.iron
    
    static let redMHColorSchemes = [cayenne, mocha, plum, maroon, maraschino, tangerine, lemon, magenta, strawberry, salmon, cantaloupe, banana, carnation]
    static let redSectionColor = UIColor.maraschino
    
    static let greenMHColorSchemes = [aspargus, fern, clover, moss, teal, lime, spring, seaFoam, honeydew, flora, spindrift ]
    static let greenSectionColor = UIColor.moss
    
    static let blueMHColorSchemes = [ocean, midnight, eggplant, turquoise, aqua, blueberry, grape, ice, sky, orchid, lavender]
    static let blueSectionColor = UIColor.ocean
    
    // MARK: - MHColorSchemes
    
    static let cantaloupe = MHColorScheme(backgroundColor: .cantaloupe, textColor: .white, sectionColor: .cantaloupe, name: "cantaloupe")
    static let honeydew =   MHColorScheme(backgroundColor: .honeydew, textColor: .tungsten, sectionColor: .honeydew, name: "honeydew")
    static let spindrift =  MHColorScheme(backgroundColor: .spindrift, textColor: .tungsten, sectionColor: .spindrift, name: "spindrift")
    static let sky =        MHColorScheme(backgroundColor: .sky, textColor: .white, sectionColor: .sky, name: "sky")
    static let lavender =   MHColorScheme(backgroundColor: .lavender, textColor: .white, sectionColor: .lavender, name: "lavender")
    static let carnation =  MHColorScheme(backgroundColor: .carnation, textColor: .white, sectionColor: .carnation, name: "carnation")
    static let licorice =   MHColorScheme(backgroundColor: .licorice, textColor: .white, sectionColor: .licorice, name: "licorice")
    static let snow =       MHColorScheme(backgroundColor: .snow, textColor: .tungsten, sectionColor: .snow, name: "snow")
    static let salmon =     MHColorScheme(backgroundColor: .salmon, textColor: .white, sectionColor: .salmon, name: "salmon")
    static let banana =     MHColorScheme(backgroundColor: .banana, textColor: .tungsten, sectionColor: .banana, name: "banana")
    static let flora =      MHColorScheme(backgroundColor: .flora, textColor: .tungsten, sectionColor: .flora, name: "flora")
    static let ice =        MHColorScheme(backgroundColor: .ice, textColor: .tungsten, sectionColor: .ice, name: "ice")
    static let orchid =     MHColorScheme(backgroundColor: .orchid, textColor: .white, sectionColor: .orchid, name: "orchid")
    static let bubblegum =  MHColorScheme(backgroundColor: .bubblegum, textColor: .white, sectionColor: .bubblegum, name: "bubblegum")
    static let lead =       MHColorScheme(backgroundColor: .lead, textColor: .white, sectionColor: .lead, name: "lead")
    static let mercury =    MHColorScheme(backgroundColor: .mercury, textColor: .tungsten, sectionColor: .mercury, name: "mercury")
    static let tangerine =  MHColorScheme(backgroundColor: .tangerine, textColor: .white, sectionColor: .tangerine, name: "tangerine")
    static let lime =       MHColorScheme(backgroundColor: .lime, textColor: .tungsten, sectionColor: .lime, name: "lime")
    static let seaFoam =    MHColorScheme(backgroundColor: .seaFoam, textColor: .tungsten, sectionColor: .seaFoam, name: "Sea Foam")
    static let aqua =       MHColorScheme(backgroundColor: .aqua, textColor: .white, sectionColor: .aqua, name: "aqua")
    static let grape =      MHColorScheme(backgroundColor: .grape, textColor: .white, sectionColor: .grape, name: "grape")
    static let strawberry = MHColorScheme(backgroundColor: .strawberry, textColor: .white, sectionColor: .strawberry, name: "strawberry")
    static let tungsten =   MHColorScheme(backgroundColor: .tungsten, textColor: .white, sectionColor: .tungsten, name: "tungsten")
    static let silver =     MHColorScheme(backgroundColor: .silver, textColor: .tungsten, sectionColor: .silver, name: "silver")
    static let maraschino = MHColorScheme(backgroundColor: .maraschino, textColor: .white, sectionColor: .maraschino, name: "maraschino")
    static let lemon =      MHColorScheme(backgroundColor: .lemon, textColor: .tungsten, sectionColor: .lemon, name: "lemon")
    static let spring =     MHColorScheme(backgroundColor: .spring, textColor: .tungsten, sectionColor: .spring, name: "spring")
    static let turquoise =  MHColorScheme(backgroundColor: .turquoise, textColor: .tungsten, sectionColor: .turquoise, name: "turquoise")
    static let blueberry =  MHColorScheme(backgroundColor: .blueberry, textColor: .white, sectionColor: .blueberry, name: "blueberry")
    static let magenta =    MHColorScheme(backgroundColor: .magenta, textColor: .white, sectionColor: .magenta, name: "magenta")
    static let iron =       MHColorScheme(backgroundColor: .iron, textColor: .white, sectionColor: .iron, name: "iron")
    static let magnesium =  MHColorScheme(backgroundColor: .magnesium, textColor: .white, sectionColor: .magnesium, name: "magnesium")
    static let mocha =      MHColorScheme(backgroundColor: .mocha, textColor: .white, sectionColor: .mocha, name: "mocha")
    static let fern =       MHColorScheme(backgroundColor: .fern, textColor: .white, sectionColor: .fern, name: "fern")
    static let moss =       MHColorScheme(backgroundColor: .moss, textColor: .white, sectionColor: .moss, name: "moss")
    static let ocean =      MHColorScheme(backgroundColor: .ocean, textColor: .white, sectionColor: .ocean, name: "ocean")
    static let eggplant =   MHColorScheme(backgroundColor: .eggplant, textColor: .white, sectionColor: .eggplant, name: "eggplant")
    static let maroon =     MHColorScheme(backgroundColor: .maroon, textColor: .white, sectionColor: .maroon, name: "maroon")
    static let steel =      MHColorScheme(backgroundColor: .steel, textColor: .white, sectionColor: .steel, name: "steel")
    static let aluminum =   MHColorScheme(backgroundColor: .aluminum, textColor: .white, sectionColor: .aluminum, name: "aluminum")
    static let cayenne =    MHColorScheme(backgroundColor: .cayenne, textColor: .white, sectionColor: .cayenne, name: "cayenne")
    static let aspargus =   MHColorScheme(backgroundColor: .aspargus, textColor: .white, sectionColor: .aspargus, name: "aspargus")
    static let clover =     MHColorScheme(backgroundColor: .clover, textColor: .white, sectionColor: .clover, name: "clover")
    static let teal =       MHColorScheme(backgroundColor: .teal, textColor: .white, sectionColor: .teal, name: "teal")
    static let midnight =   MHColorScheme(backgroundColor: .midnight, textColor: .white, sectionColor: .midnight, name: "midnight")
    static let plum =       MHColorScheme(backgroundColor: .plum, textColor: .white, sectionColor: .plum, name: "plum")
    static let tin =        MHColorScheme(backgroundColor: .tin, textColor: .white, sectionColor: .tin, name: "tin")
    static let nickel =     MHColorScheme(backgroundColor: .nickel, textColor: .white, sectionColor: .nickel, name: "nickel")
    
    //static let MHColorSchemes = [standard, black, white, red, orange, yellow, blue, green, greenInverse, purple]
    
    
    
    
    
    
}


extension UIColor {
    
    static let cantaloupe = UIColor.init(red:255.0/255.0, green:206.0/255.0, blue:110.0/255.0, alpha: 1)
    static let honeydew =   UIColor.init(red:206.0/255.0, green:250.0/255.0, blue:110.0/255.0, alpha: 1)
    static let spindrift =  UIColor.init(red:104.0/255.0, green:251.0/255.0, blue:208.0/255.0, alpha: 1)
    static let sky =        UIColor.init(red:106.0/255.0, green:207.0/255.0, blue:255.0/255.0, alpha: 1)
    static let lavender =   UIColor.init(red:210.0/255.0, green:120.0/255.0, blue:255.0/255.0, alpha: 1)
    static let carnation =  UIColor.init(red:255.0/255.0, green:127.0/255.0, blue:211.0/255.0, alpha: 1)
    static let licorice =   UIColor.init(red:0.0/255.0, green:0.0/255.0, blue:0.0/255.0, alpha: 1)
    static let snow =       UIColor.init(red:255.0/255.0, green:255.0/255.0, blue:255.0/255.0, alpha: 1)
    static let salmon =     UIColor.init(red:255.0/255.0, green:114.0/255.0, blue:110.0/255.0, alpha: 1)
    static let banana =     UIColor.init(red:255.0/255.0, green:251.0/255.0, blue:109.0/255.0, alpha: 1)
    static let flora =      UIColor.init(red:104.0/255.0, green:249.0/255.0, blue:110.0/255.0, alpha: 1)
    static let ice =        UIColor.init(red:104.0/255.0, green:253.0/255.0, blue:255.0/255.0, alpha: 1)
    static let orchid =     UIColor.init(red:110.0/255.0, green:118.0/255.0, blue:255.0/255.0, alpha: 1)
    static let bubblegum =  UIColor.init(red:255.0/255.0, green:122.0/255.0, blue:255.0/255.0, alpha: 1)
    static let lead =       UIColor.init(red:30.0/255.0, green:30.0/255.0, blue:30.0/255.0, alpha: 1)
    static let mercury =    UIColor.init(red:232.0/255.0, green:232.0/255.0, blue:232.0/255.0, alpha: 1)
    static let tangerine =  UIColor.init(red:255.0/255.0, green:136.0/255.0, blue:2.0/255.0, alpha: 1)
    static let lime =       UIColor.init(red:131.0/255.0, green:249.0/255.0, blue:2.0/255.0, alpha: 1)
    static let seaFoam =    UIColor.init(red:3.0/255.0, green:249.0/255.0, blue:135.0/255.0, alpha: 1)
    static let aqua =       UIColor.init(red:0.0/255.0, green:140.0/255.0, blue:255.0/255.0, alpha: 1)
    static let grape =      UIColor.init(red:137.0/255.0, green:49.0/255.0, blue:255.0/255.0, alpha: 1)
    static let strawberry = UIColor.init(red:255.0/255.0, green:41.0/255.0, blue:135.0/255.0, alpha: 1)
    static let tungsten =   UIColor.init(red:58.0/255.0, green:58.0/255.0, blue:58.0/255.0, alpha: 1)
    static let silver =     UIColor.init(red:208.0/255.0, green:208.0/255.0, blue:208.0/255.0, alpha: 1)
    static let maraschino = UIColor.init(red:255.0/255.0, green:33.0/255.0, blue:1.0/255.0, alpha: 1)
    static let lemon =      UIColor.init(red:255.0/255.0, green:250.0/255.0, blue:3.0/255.0, alpha: 1)
    static let spring =     UIColor.init(red:5.0/255.0, green:248.0/255.0, blue:2.0/255.0, alpha: 1)
    static let turquoise =  UIColor.init(red:0.0/255.0, green:253.0/255.0, blue:255.0/255.0, alpha: 1)
    static let blueberry =  UIColor.init(red:0.0/255.0, green:46.0/255.0, blue:255.0/255.0, alpha: 1)
    static let magenta =    UIColor.init(red:255.0/255.0, green:57.0/255.0, blue:255.0/255.0, alpha: 1)
    static let iron =       UIColor.init(red:84.0/255.0, green:84.0/255.0, blue:83.0/255.0, alpha: 1)
    static let magnesium =  UIColor.init(red:184.0/255.0, green:184.0/255.0, blue:184.0/255.0, alpha: 1)
    static let mocha =      UIColor.init(red:137.0/255.0, green:72.0/255.0, blue:0.0/255.0, alpha: 1)
    static let fern =       UIColor.init(red:69.0/255.0, green:132.0/255.0, blue:1.0/255.0, alpha: 1)
    static let moss =       UIColor.init(red:1.0/255.0, green:132.0/255.0, blue:72.0/255.0, alpha: 1)
    static let ocean =      UIColor.init(red:0.0/255.0, green:74.0/255.0, blue:136.0/255.0, alpha: 1)
    static let eggplant =   UIColor.init(red:73.0/255.0, green:26.0/255.0, blue:136.0/255.0, alpha: 1)
    static let maroon =     UIColor.init(red:137.0/255.0, green:22.0/255.0, blue:72.0/255.0, alpha: 1)
    static let steel =      UIColor.init(red:110.0/255.0, green:110.0/255.0, blue:110.0/255.0, alpha: 1)
    static let aluminum =   UIColor.init(red:160.0/255.0, green:159.0/255.0, blue:160.0/255.0, alpha: 1)
    static let cayenne =    UIColor.init(red:137.0/255.0, green:17.0/255.0, blue:0.0/255.0, alpha: 1)
    static let aspargus =   UIColor.init(red:136.0/255.0, green:133.0/255.0, blue:1.0/255.0, alpha: 1)
    static let clover =     UIColor.init(red:2.0/255.0, green:132.0/255.0, blue:1.0/255.0, alpha: 1)
    static let teal =       UIColor.init(red:0.0/255.0, green:134.0/255.0, blue:136.0/255.0, alpha: 1)
    static let midnight =   UIColor.init(red:0.0/255.0, green:24.0/255.0, blue:136.0/255.0, alpha: 1)
    static let plum =       UIColor.init(red:137.0/255.0, green:30.0/255.0, blue:136.0/255.0, alpha: 1)
    static let tin =        UIColor.init(red:135.0/255.0, green:134.0/255.0, blue:135.0/255.0, alpha: 1)
    static let nickel =     UIColor.init(red:136.0/255.0, green:135.0/255.0, blue:135.0/255.0, alpha: 1)
}

extension UIColor {
    enum HexFormat {
        case RGB
        case ARGB
        case RGBA
        case RRGGBB
        case AARRGGBB
        case RRGGBBAA
    }
    
    enum HexDigits {
        case d3, d4, d6, d8
    }
    
    func hexString(_ format: HexFormat = .RRGGBBAA) -> String {
        let maxi = [.RGB, .ARGB, .RGBA].contains(format) ? 16 : 256
        
        func toI(_ f: CGFloat) -> Int {
            return min(maxi - 1, Int(CGFloat(maxi) * f))
        }
        
        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 0
        
        self.getRed(&r, green: &g, blue: &b, alpha: &a)
        
        let ri = toI(r)
        let gi = toI(g)
        let bi = toI(b)
        let ai = toI(a)
        
        switch format {
        case .RGB:       return String(format: "#%X%X%X", ri, gi, bi)
        case .ARGB:      return String(format: "#%X%X%X%X", ai, ri, gi, bi)
        case .RGBA:      return String(format: "#%X%X%X%X", ri, gi, bi, ai)
        case .RRGGBB:    return String(format: "#%02X%02X%02X", ri, gi, bi)
        case .AARRGGBB:  return String(format: "#%02X%02X%02X%02X", ai, ri, gi, bi)
        case .RRGGBBAA:  return String(format: "#%02X%02X%02X%02X", ri, gi, bi, ai)
        }
    }
    
    func hexString(_ digits: HexDigits) -> String {
        switch digits {
        case .d3: return hexString(.RGB)
        case .d4: return hexString(.RGBA)
        case .d6: return hexString(.RRGGBB)
        case .d8: return hexString(.RRGGBBAA)
        }
    }
}


#endif
