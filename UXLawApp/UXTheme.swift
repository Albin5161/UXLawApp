import SwiftUI

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let r = Double((int >> 16) & 0xFF) / 255
        let g = Double((int >> 8) & 0xFF) / 255
        let b = Double(int & 0xFF) / 255
        self.init(red: r, green: g, blue: b)
    }
}

enum UXColor {
    static let primary            = Color(hex: "0040e0")
    static let primaryContainer   = Color(hex: "2e5bff")
    static let primaryFixed       = Color(hex: "dde1ff")
    static let onPrimary          = Color.white
    static let onPrimaryFixed     = Color(hex: "001356")
    static let onPrimaryContainer = Color(hex: "efefff")
    static let secondary          = Color(hex: "576500")
    static let secondaryContainer = Color(hex: "d0ed00")
    static let secondaryFixed     = Color(hex: "d2f000")
    static let onSecondaryFixed   = Color(hex: "191e00")
    static let onTertiaryContainer = Color(hex: "ffede7")
    static let tertiary           = Color(hex: "983307")
    static let background         = Color(hex: "fbf8ff")
    static let surface            = Color(hex: "fbf8ff")
    static let surfaceContainerLow     = Color(hex: "f3f2ff")
    static let surfaceContainer        = Color(hex: "ededfa")
    static let surfaceContainerHigh    = Color(hex: "e7e7f4")
    static let surfaceContainerHighest = Color(hex: "e2e1ef")
    static let onSurface          = Color(hex: "191b24")
    static let onSurfaceVariant   = Color(hex: "434656")
    static let outline            = Color(hex: "747688")
    static let outlineVariant     = Color(hex: "c4c5d9")
    static let brandCoral         = Color(hex: "FF7F50")
}

enum UXFont {
    static func display(_ size: CGFloat) -> Font {
        Font.custom("Playfair Display", size: size).italic()
    }
    static func headline(_ size: CGFloat) -> Font {
        Font.custom("Playfair Display", size: size).italic()
    }
    static func sectionHeader() -> Font {
        Font.custom("Manrope", size: 24).weight(.semibold)
    }
    static func body() -> Font {
        Font.custom("Manrope", size: 17)
    }
    static func labelCaps() -> Font {
        Font.custom("Manrope", size: 12).weight(.bold)
    }
    static func tabLabel() -> Font {
        Font.custom("Manrope", size: 10).weight(.medium)
    }
}

enum Tab: CaseIterable {
    case library, explore, saved, insights

    var icon: String {
        switch self {
        case .library:  "book"
        case .explore:  "safari"
        case .saved:    "bookmark"
        case .insights: "chart.bar"
        }
    }

    var label: String {
        switch self {
        case .library:  "Library"
        case .explore:  "Explore"
        case .saved:    "Saved"
        case .insights: "Insights"
        }
    }
}

struct UXBottomNavBar: View {
    @Binding var selected: Tab

    var body: some View {
        HStack(spacing: 0) {
            ForEach(Tab.allCases, id: \.self) { tab in
                Button {
                    selected = tab
                } label: {
                    VStack(spacing: 2) {
                        Image(systemName: tab.icon)
                            .font(.system(size: 20))
                        Text(tab.label.uppercased())
                            .font(UXFont.tabLabel())
                            .tracking(1)
                    }
                    .foregroundStyle(selected == tab ? Color.white : Color(hex: "9ca3af"))
                    .padding(.horizontal, 16)
                    .padding(.vertical, 10)
                    .background(selected == tab ? Color(hex: "3f3f46").opacity(0.8) : Color.clear)
                    .clipShape(Capsule())
                }
            }
        }
        .padding(8)
        .background(Color(hex: "18181b"))
        .clipShape(Capsule())
        .shadow(color: .black.opacity(0.3), radius: 12, x: 0, y: 4)
    }
}
