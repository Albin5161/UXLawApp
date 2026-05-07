import SwiftUI

struct LibrarySearchView: View {
    @State private var searchText = ""
    @State private var selectedFilter = "All Laws"
    @State private var navigateToMillers = false

    private let filters = ["All Laws", "Perception", "Memory", "Interaction", "Cognition"]

    private let laws: [(num: String, title: String, desc: String, tag: String, mins: String)] = [
        ("01", "Hick's Law", "The time it takes to make a decision increases with the number and complexity of choices.", "Cognition", "4 min read"),
        ("02", "Fitts's Law", "The time to acquire a target is a function of the distance to and size of the target.", "Interaction", "6 min read"),
        ("03", "Jakob's Law", "Users spend most of their time on other sites, meaning they prefer your site to work the same way.", "Mental Models", "3 min read"),
        ("04", "Law of Proximity", "Objects that are near, or proximate to each other, tend to be grouped together.", "Perception", "5 min read"),
    ]

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 0) {
                    searchAndFilter
                    lawsSection
                }
                .padding(.bottom, 100)
            }
            .background(UXColor.background)
            .safeAreaInset(edge: .top) { topBar }
            .navigationBarHidden(true)
            .navigationDestination(isPresented: $navigateToMillers) {
                LawDetailMillersLawView()
            }
        }
    }

    private var topBar: some View {
        HStack(spacing: 16) {
            AsyncImage(url: URL(string: "https://lh3.googleusercontent.com/aida-public/AB6AXuCenNgMKvp4o9kl_5ZQSfzZ0zV0LgLeVjxm0RblYOesgywLqscvPp47iVzL1oks0fqZEK3MOmu_18sydUma-jFcDE0Ub20H3gJpuq-JZSjnBg9i4shjYwvW9g1imseAFg7dUpj9o4Tz62yQiq-BE0AtLr3fSrYhE-kVcQTByBSSxq2K8jdNqHDUK9IzJ5lKPAX5S3x0whvcmYVBLHHj8B-ZxLmQobuTWLC7vHNOnrL4gCyGMgse_6YTShBjyoiSGvS5_6ZNZHSOcAg")) { phase in
                if let img = phase.image { img.resizable().scaledToFill() }
                else { Circle().fill(UXColor.surfaceContainerHigh) }
            }
            .frame(width: 40, height: 40)
            .clipShape(Circle())
            .overlay(Circle().stroke(UXColor.outlineVariant, lineWidth: 1))

            Text("UX Psychology")
                .font(UXFont.headline(24))
                .foregroundStyle(Color(hex: "18181b"))

            Spacer()

            Image(systemName: "magnifyingglass")
                .font(.system(size: 20))
                .foregroundStyle(UXColor.primary)
                .padding(8)
        }
        .padding(.horizontal, 24)
        .padding(.vertical, 16)
        .background(Color.white)
        .overlay(alignment: .bottom) { Divider() }
    }

    private var searchAndFilter: some View {
        VStack(spacing: 0) {
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundStyle(UXColor.outline)
                TextField("Search psychological principles...", text: $searchText)
                    .font(UXFont.body())
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 14)
            .background(UXColor.surfaceContainerLow)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .overlay(RoundedRectangle(cornerRadius: 12).stroke(UXColor.outlineVariant, lineWidth: 1))
            .padding(.horizontal, 24)
            .padding(.top, 24)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 8) {
                    ForEach(filters, id: \.self) { filter in
                        Button(filter) { selectedFilter = filter }
                            .font(UXFont.labelCaps())
                            .tracking(1)
                            .foregroundStyle(selectedFilter == filter ? Color.white : UXColor.onSurface)
                            .padding(.horizontal, 24)
                            .padding(.vertical, 8)
                            .background(selectedFilter == filter ? Color(hex: "18181b") : Color.clear)
                            .clipShape(Capsule())
                            .overlay(Capsule().stroke(selectedFilter == filter ? Color.clear : UXColor.outlineVariant, lineWidth: 1))
                    }
                }
                .padding(.horizontal, 24)
                .padding(.vertical, 16)
            }
        }
    }

    private var lawsSection: some View {
        VStack(alignment: .leading, spacing: 24) {
            HStack {
                Text("Foundational Laws")
                    .font(UXFont.sectionHeader())
                    .foregroundStyle(UXColor.onSurface)
                Spacer()
                Text("24 Articles")
                    .font(UXFont.labelCaps())
                    .tracking(1.5)
                    .foregroundStyle(UXColor.outline)
            }

            // Items before featured
            ForEach(0..<2, id: \.self) { i in
                lawRow(laws[i])
                Divider().background(UXColor.surfaceContainerHighest)
            }

            // Featured card: Zeigarnik Effect
            ZStack(alignment: .topTrailing) {
                LinearGradient(
                    colors: [UXColor.primaryContainer, UXColor.primary],
                    startPoint: .topLeading, endPoint: .bottomTrailing
                )
                AsyncImage(url: URL(string: "https://lh3.googleusercontent.com/aida-public/AB6AXuCxWImFInA6R3oRAeL7JK2VtDC7EGw6HtqA7-84USRJi1IeQxmyj1eiXkqj-poiwbXGX9t7aC5Ec2dhrdquobFJvveaC4YbnLebMxWoCPTi1U8AcGRb8BkCi4o6pfKhjL3ir5BsM15pIscmMIqOzSPUdK66s13CqeB1G0E5nhg69viQBVN-1BL7W_h5ngZrI6Gjp7wN1EZ6RI7QAQ1RguxxFN2MUIiOzM_cXPJKLCaFEZnRwhHdjIv_PfL4e3BPtfvH8eB4f7xzPDA")) { phase in
                    if let img = phase.image {
                        img.resizable().scaledToFill().opacity(0.2)
                    }
                }
                .clipped()

                VStack(alignment: .leading, spacing: 24) {
                    Text("INSIGHT OF THE DAY")
                        .font(UXFont.labelCaps())
                        .tracking(2)
                        .foregroundStyle(UXColor.onPrimaryContainer.opacity(0.8))

                    Text("The Zeigarnik Effect: Why unfinished tasks haunt our memory.")
                        .font(UXFont.headline(28))
                        .foregroundStyle(.white)

                    Button("Read Insight") {}
                        .font(UXFont.labelCaps())
                        .tracking(1)
                        .foregroundStyle(UXColor.primary)
                        .padding(.horizontal, 32)
                        .padding(.vertical, 12)
                        .background(Color.white)
                        .clipShape(Capsule())
                }
                .padding(32)
            }
            .frame(height: 220)
            .clipShape(RoundedRectangle(cornerRadius: 24))

            // Items after featured
            ForEach(2..<laws.count, id: \.self) { i in
                Divider().background(UXColor.surfaceContainerHighest)
                lawRow(laws[i])
            }
        }
        .padding(.horizontal, 24)
        .padding(.vertical, 24)
    }

    private func lawRow(_ law: (num: String, title: String, desc: String, tag: String, mins: String)) -> some View {
        HStack(alignment: .top, spacing: 24) {
            Text(law.num)
                .font(UXFont.headline(22))
                .foregroundStyle(UXColor.primary.opacity(0.3))
                .frame(width: 28)
                .padding(.top, 4)

            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    Button {
                        if law.num == "01" { navigateToMillers = true }
                    } label: {
                        Text(law.title)
                            .font(UXFont.headline(22))
                            .foregroundStyle(UXColor.onSurface)
                    }
                    Spacer()
                    Image(systemName: "bookmark")
                        .foregroundStyle(UXColor.outline)
                }

                Text(law.desc)
                    .font(UXFont.body())
                    .foregroundStyle(UXColor.onSurfaceVariant)
                    .fixedSize(horizontal: false, vertical: true)

                HStack(spacing: 8) {
                    chip(law.tag)
                    chip(law.mins)
                }
            }
        }
    }

    private func chip(_ text: String) -> some View {
        Text(text.uppercased())
            .font(.system(size: 11, weight: .bold))
            .tracking(1.5)
            .foregroundStyle(UXColor.onSurfaceVariant)
            .padding(.horizontal, 12)
            .padding(.vertical, 4)
            .background(UXColor.surfaceContainerHigh)
            .clipShape(Capsule())
    }
}

#Preview {
    LibrarySearchView()
}
