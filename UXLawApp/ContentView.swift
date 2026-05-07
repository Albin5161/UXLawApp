import SwiftUI

struct ContentView: View {
    @State private var selectedTab: Tab = .library

    var body: some View {
        ZStack(alignment: .bottom) {
            Group {
                switch selectedTab {
                case .library:
                    LibrarySearchView()
                case .insights:
                    ProfileMasteryView()
                case .explore, .saved:
                    PlaceholderView(tab: selectedTab)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)

            UXBottomNavBar(selected: $selectedTab)
                .padding(.horizontal, 24)
                .padding(.bottom, 24)
        }
        .ignoresSafeArea(edges: .bottom)
    }
}

private struct PlaceholderView: View {
    let tab: Tab
    var body: some View {
        VStack(spacing: 12) {
            Image(systemName: tab.icon)
                .font(.system(size: 48))
                .foregroundStyle(UXColor.primary)
            Text(tab.label)
                .font(UXFont.sectionHeader())
                .foregroundStyle(UXColor.onSurface)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(UXColor.background)
    }
}

#Preview {
    ContentView()
}
