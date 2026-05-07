import SwiftUI

struct HomepageView: View {
    @State private var navigateToHicks = false
    @State private var navigateToMillers = false

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 48) {
                    heroSection
                    lawGridSection
                    mentalModelsSection
                }
                .padding(.bottom, 100)
            }
            .background(UXColor.background)
            .safeAreaInset(edge: .top) { topBar }
            .navigationBarHidden(true)
            .navigationDestination(isPresented: $navigateToHicks) {
                LawDetailHicksLawView()
            }
            .navigationDestination(isPresented: $navigateToMillers) {
                LawDetailMillersLawView()
            }
        }
    }

    private var topBar: some View {
        HStack {
            HStack(spacing: 8) {
                Image(systemName: "chevron.left")
                    .foregroundStyle(UXColor.primary)
                    .font(.system(size: 18, weight: .medium))
                Text("UX Psychology")
                    .font(UXFont.headline(20))
                    .foregroundStyle(Color(hex: "18181b"))
            }
            Spacer()
            Image(systemName: "magnifyingglass")
                .foregroundStyle(UXColor.primary)
                .font(.system(size: 20))
                .padding(8)
        }
        .padding(.horizontal, 24)
        .padding(.vertical, 16)
        .background(Color.white)
        .overlay(alignment: .bottom) { Divider() }
    }

    private var heroSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("THEORETICAL FOUNDATIONS")
                .font(UXFont.labelCaps())
                .tracking(2)
                .foregroundStyle(UXColor.primary)
            Text("Laws of ")
                .font(UXFont.display(48))
                .foregroundStyle(UXColor.onSurface)
            + Text("Cognition")
                .font(UXFont.display(48))
                .foregroundStyle(UXColor.onSurface)
            Text("Exploring the mental shortcuts and psychological principles that define how humans interact with digital systems.")
                .font(UXFont.body())
                .foregroundStyle(UXColor.onSurfaceVariant)
                .frame(maxWidth: 340, alignment: .leading)
        }
        .padding(.horizontal, 24)
        .padding(.top, 32)
    }

    private var lawGridSection: some View {
        VStack(spacing: 16) {
            HStack(spacing: 16) {
                lawCard(
                    number: "01",
                    title: "Fitts's Law",
                    tag: "Interaction Design",
                    description: "The time to acquire a target is a function of the distance to and size of the target.",
                    bg: UXColor.primaryContainer,
                    titleColor: .white,
                    tagBg: Color.white.opacity(0.15),
                    tagColor: .white,
                    descColor: UXColor.onPrimaryContainer.opacity(0.8),
                    arrowBorder: Color.white.opacity(0.3),
                    onTap: nil
                )
                lawCard(
                    number: "02",
                    title: "Hick's Law",
                    tag: "Cognitive Load",
                    description: "The time to make a decision increases with the number and complexity of choices.",
                    bg: UXColor.secondaryContainer,
                    titleColor: UXColor.onSecondaryFixed,
                    tagBg: Color.black.opacity(0.05),
                    tagColor: UXColor.onSecondaryFixed,
                    descColor: UXColor.onSecondaryFixed.opacity(0.8),
                    arrowBorder: UXColor.onSecondaryFixed.opacity(0.3),
                    onTap: { navigateToHicks = true }
                )
            }
            HStack(spacing: 16) {
                lawCard(
                    number: "03",
                    title: "Jakob's Law",
                    tag: "User Mental Models",
                    description: "Users spend most of their time on other sites, so they prefer your site to work the same way.",
                    bg: UXColor.surfaceContainerLow,
                    titleColor: UXColor.onSurface,
                    tagBg: UXColor.primary.opacity(0.05),
                    tagColor: UXColor.primary,
                    descColor: UXColor.onSurfaceVariant,
                    arrowBorder: UXColor.primary.opacity(0.3),
                    onTap: nil
                )
                lawCard(
                    number: "04",
                    title: "Miller's Law",
                    tag: "Working Memory",
                    description: "The average person can only keep 7 (plus or minus 2) items in their working memory.",
                    bg: Color(hex: "b84b20"),
                    titleColor: .white,
                    tagBg: Color.white.opacity(0.15),
                    tagColor: .white,
                    descColor: UXColor.onTertiaryContainer.opacity(0.8),
                    arrowBorder: Color.white.opacity(0.3),
                    onTap: { navigateToMillers = true }
                )
            }

            // Full-width Zeigarnik featured card
            ZStack(alignment: .leading) {
                Color(hex: "18181b")
                HStack(spacing: 0) {
                    VStack(alignment: .leading, spacing: 24) {
                        HStack(spacing: 8) {
                            Circle().fill(UXColor.secondary).frame(width: 8, height: 8)
                            Text("DEEP DIVE")
                                .font(.system(size: 10, weight: .bold))
                                .tracking(2)
                                .foregroundStyle(.white)
                        }
                        Text("The Zeigarnik Effect")
                            .font(UXFont.headline(36))
                            .foregroundStyle(.white)
                        Text("People remember uncompleted or interrupted tasks better than completed ones.")
                            .font(UXFont.body())
                            .foregroundStyle(UXColor.surfaceContainerHigh)
                        Button("Read Case Study") {}
                            .font(UXFont.labelCaps())
                            .tracking(1)
                            .foregroundStyle(Color(hex: "18181b"))
                            .padding(.horizontal, 24)
                            .padding(.vertical, 12)
                            .background(Color.white)
                            .clipShape(Capsule())
                    }
                    .padding(32)
                    .frame(maxWidth: .infinity, alignment: .leading)

                    AsyncImage(url: URL(string: "https://lh3.googleusercontent.com/aida-public/AB6AXuB_bLl2qs_Mwj_nUeyuemLeGOUdtwUME8doXlifbuh6yPSkHIU4YoA2PyskyHq-YROc3PxV9Uv_pyhpkvsZg5db96Kd0cU_kJ8sxHtVFZ2GrSKRPhZbHUSa6y-TvqhGIZFWfGlZjNFZb2Q9ES1-PEAczodhzkwl7GZZl8_HknRRs4sPNUs5UWt-faf13zhWnEz314q-rJhdVwzrWFaMTZeqqInYVs-nv1MLTCHARQjpT7DRPFJojv_88f_Jcnhuk5V9-b8D09s6E54")) { phase in
                        if let img = phase.image { img.resizable().scaledToFill().grayscale(1) }
                        else { Rectangle().fill(Color(hex: "27272a")) }
                    }
                    .frame(width: 130)
                    .clipped()
                }
            }
            .frame(height: 260)
            .clipShape(RoundedRectangle(cornerRadius: 24))
        }
        .padding(.horizontal, 24)
    }

    private func lawCard(
        number: String, title: String, tag: String, description: String,
        bg: Color, titleColor: Color, tagBg: Color, tagColor: Color,
        descColor: Color, arrowBorder: Color, onTap: (() -> Void)?
    ) -> some View {
        Button(action: { onTap?() }) {
            VStack(alignment: .leading, spacing: 0) {
                HStack(alignment: .top) {
                    Text(number)
                        .font(UXFont.headline(48))
                        .foregroundStyle(titleColor.opacity(0.2))
                    Spacer()
                    Text(tag)
                        .font(.system(size: 10, weight: .bold))
                        .tracking(1)
                        .foregroundStyle(tagColor)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 4)
                        .background(tagBg)
                        .clipShape(Capsule())
                }
                Spacer()
                Text(title)
                    .font(UXFont.headline(32))
                    .foregroundStyle(titleColor)
                    .padding(.bottom, 6)
                Text(description)
                    .font(.system(size: 13))
                    .foregroundStyle(descColor)
                    .lineLimit(3)
                    .padding(.bottom, 16)
                HStack {
                    Spacer()
                    ZStack {
                        Circle()
                            .stroke(arrowBorder, lineWidth: 1)
                            .frame(width: 44, height: 44)
                        Image(systemName: "arrow.up.right")
                            .foregroundStyle(titleColor)
                            .font(.system(size: 16))
                    }
                }
            }
            .padding(24)
            .frame(maxWidth: .infinity)
            .frame(height: 260)
            .background(bg)
            .clipShape(RoundedRectangle(cornerRadius: 24))
        }
        .buttonStyle(.plain)
    }

    private var mentalModelsSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Divider().padding(.horizontal, 24)
            VStack(alignment: .leading, spacing: 0) {
                Text("Mental ")
                    .font(UXFont.sectionHeader())
                    .foregroundStyle(UXColor.onSurface)
                    .italic()
                + Text("Models")
                    .font(UXFont.sectionHeader().weight(.bold))
                    .foregroundStyle(UXColor.onSurface)
            }
            .padding(.horizontal, 24)
            .padding(.top, 8)

            VStack(spacing: 12) {
                principleRow(icon: "eye", title: "Von Restorff Effect")
                principleRow(icon: "chart.bar.fill", title: "Pareto Principle")
                principleRow(icon: "clock.arrow.circlepath", title: "Peak-End Rule")
            }
            .padding(.horizontal, 24)
        }
    }

    private func principleRow(icon: String, title: String) -> some View {
        HStack {
            HStack(spacing: 16) {
                Image(systemName: icon)
                    .foregroundStyle(UXColor.primary)
                    .frame(width: 24)
                Text(title)
                    .font(UXFont.sectionHeader())
                    .foregroundStyle(UXColor.onSurface)
            }
            Spacer()
            Image(systemName: "chevron.right")
                .foregroundStyle(UXColor.onSurfaceVariant)
        }
        .padding(20)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color(hex: "e4e4e7"), lineWidth: 1))
    }
}

#Preview {
    HomepageView()
}
