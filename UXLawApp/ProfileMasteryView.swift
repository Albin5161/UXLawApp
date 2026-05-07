import SwiftUI

struct ProfileMasteryView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 48) {
                heroSection
                masterySection
                recentLearningSection
                statsSection
            }
            .padding(.bottom, 100)
        }
        .background(UXColor.background)
        .safeAreaInset(edge: .top) { topBar }
    }

    private var topBar: some View {
        HStack {
            HStack(spacing: 12) {
                AsyncImage(url: URL(string: "https://lh3.googleusercontent.com/aida-public/AB6AXuA52YthPjnq4QZTBAhkEsBv86cfZVVX2LW7Z8LP2B2DPD6trwegR0B9VWt5io1VOyYJFOjTUDAOeB0Ya9yhwj5g2DaFyMXzWE0uu_C0IMlyJBFj2W2CnLqYCJgnEGAnwBMsW_7qjAY0loFZF5bJpkC_DdTCKiLphvtXUFi6u3cE700rmsF66F7WrtOEFsNBUgEohTH8f9tQLYZnu-eO3qTjM83h2LAZkgSXEdMFtup44pZANjuJsl-PjcY1n3hkDQft2F5D00K_NEA")) { phase in
                    if let img = phase.image { img.resizable().scaledToFill() }
                    else { Circle().fill(UXColor.surfaceContainerHigh) }
                }
                .frame(width: 40, height: 40)
                .clipShape(Circle())
                .overlay(Circle().stroke(UXColor.outlineVariant, lineWidth: 1))

                Text("UX Psychology")
                    .font(UXFont.headline(24))
                    .foregroundStyle(Color(hex: "18181b"))
            }
            Spacer()
            Image(systemName: "magnifyingglass")
                .font(.system(size: 20))
                .foregroundStyle(UXColor.onSurfaceVariant)
                .padding(8)
                .background(Color.white)
                .clipShape(Circle())
        }
        .padding(.horizontal, 24)
        .padding(.vertical, 16)
        .background(Color.white)
        .overlay(alignment: .bottom) {
            Divider()
        }
    }

    private var heroSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("CURRENT FOCUS: COGNITIVE LOAD")
                .font(UXFont.labelCaps())
                .tracking(1.5)
                .foregroundStyle(UXColor.primary)

            Text("Hello, Sarah.")
                .font(UXFont.display(48))
                .foregroundStyle(UXColor.onSurface)

            Text("You've mastered ")
                .font(UXFont.body())
                .foregroundStyle(UXColor.onSurfaceVariant)
            + Text("64%")
                .font(UXFont.body().weight(.bold))
                .foregroundStyle(UXColor.primary)
            + Text(" of the behavioral economics track this month.")
                .font(UXFont.body())
                .foregroundStyle(UXColor.onSurfaceVariant)

            Button("CONTINUE READING") {}
                .font(UXFont.labelCaps())
                .tracking(1)
                .foregroundStyle(Color.white)
                .padding(.horizontal, 24)
                .padding(.vertical, 12)
                .background(UXColor.primary)
                .clipShape(RoundedRectangle(cornerRadius: 12))
        }
        .padding(.horizontal, 24)
        .padding(.top, 32)
    }

    private var masterySection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Knowledge Mastery")
                .font(UXFont.sectionHeader())
                .foregroundStyle(UXColor.onSurface)
                .padding(.horizontal, 24)

            HStack(spacing: 16) {
                masteryCard(
                    icon: "brain.head.profile",
                    iconBg: UXColor.secondaryContainer,
                    iconFg: UXColor.onSecondaryFixed,
                    level: "LEVEL 08",
                    title: "Cognitive Bias",
                    subtitle: "Heuristics and mental shortcuts.",
                    progress: 0.78,
                    nodes: "12/15 Nodes"
                )
                masteryCard(
                    icon: "eye",
                    iconBg: UXColor.primaryFixed,
                    iconFg: UXColor.onPrimaryFixed,
                    level: "LEVEL 05",
                    title: "Visual Perception",
                    subtitle: "Gestalt principles and ocular focus.",
                    progress: 0.45,
                    nodes: "09/20 Nodes"
                )
            }
            .padding(.horizontal, 24)
        }
    }

    private func masteryCard(icon: String, iconBg: Color, iconFg: Color, level: String, title: String, subtitle: String, progress: Double, nodes: String) -> some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                ZStack {
                    Circle().fill(iconBg).frame(width: 48, height: 48)
                    Image(systemName: icon).foregroundStyle(iconFg)
                }
                Spacer()
                Text(level)
                    .font(UXFont.labelCaps())
                    .tracking(1)
                    .foregroundStyle(UXColor.onSurfaceVariant)
            }
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(UXFont.headline(20))
                    .foregroundStyle(UXColor.onSurface)
                Text(subtitle)
                    .font(.system(size: 13))
                    .foregroundStyle(UXColor.onSurfaceVariant)
            }
            VStack(spacing: 6) {
                GeometryReader { geo in
                    ZStack(alignment: .leading) {
                        RoundedRectangle(cornerRadius: 4).fill(UXColor.surfaceContainerHighest).frame(height: 6)
                        RoundedRectangle(cornerRadius: 4).fill(UXColor.primary).frame(width: geo.size.width * progress, height: 6)
                    }
                }
                .frame(height: 6)
                HStack {
                    Text("\(Int(progress * 100))% Mastery")
                    Spacer()
                    Text(nodes)
                }
                .font(.system(size: 10, weight: .bold))
                .tracking(1.5)
                .textCase(.uppercase)
                .foregroundStyle(UXColor.onSurfaceVariant)
            }
        }
        .padding(24)
        .background(UXColor.surfaceContainerLow)
        .clipShape(RoundedRectangle(cornerRadius: 24))
        .overlay(RoundedRectangle(cornerRadius: 24).stroke(UXColor.outlineVariant, lineWidth: 1))
    }

    private var recentLearningSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Text("Recent Learning")
                    .font(UXFont.sectionHeader())
                    .foregroundStyle(UXColor.onSurface)
                Spacer()
                Text("VIEW ALL")
                    .font(UXFont.labelCaps())
                    .tracking(1)
                    .foregroundStyle(UXColor.primary)
                    .overlay(alignment: .bottom) {
                        Rectangle().fill(UXColor.primary).frame(height: 2).offset(y: 2)
                    }
            }
            .padding(.horizontal, 24)

            VStack(spacing: 24) {
                // Large feature card
                ZStack(alignment: .bottomLeading) {
                    Color(hex: "DFFF00")
                    Image(systemName: "network")
                        .font(.system(size: 160))
                        .foregroundStyle(Color.black.opacity(0.08))
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
                        .padding()

                    VStack(alignment: .leading, spacing: 24) {
                        Text("DEEP DIVE")
                            .font(.system(size: 10, weight: .bold))
                            .tracking(1)
                            .foregroundStyle(Color.black)
                            .padding(.horizontal, 12)
                            .padding(.vertical, 4)
                            .background(Color.white)
                            .clipShape(Capsule())
                            .overlay(Capsule().stroke(Color.black, lineWidth: 1))

                        Text("The Paradox of Choice in Interface Design")
                            .font(UXFont.headline(28))
                            .foregroundStyle(Color.black)
                            .frame(maxWidth: 220, alignment: .leading)

                        HStack(spacing: 16) {
                            VStack(alignment: .leading, spacing: 2) {
                                Text("Resumed 2h ago").font(.system(size: 13, weight: .bold)).foregroundStyle(Color.black)
                                Text("14 min remaining").font(.system(size: 12)).foregroundStyle(Color.black.opacity(0.7))
                            }
                            Spacer()
                            ZStack {
                                Circle().fill(Color.black).frame(width: 48, height: 48)
                                Image(systemName: "play.fill").foregroundStyle(Color.white)
                            }
                        }
                    }
                    .padding(32)
                }
                .frame(height: 300)
                .clipShape(RoundedRectangle(cornerRadius: 32))
                .padding(.horizontal, 24)

                // Secondary cards
                VStack(spacing: 16) {
                    smallCard(tag: "Micro-Interaction", tagColor: UXColor.tertiary, title: "Fitts's Law", trailing: {
                        AnyView(Image(systemName: "checkmark.circle.fill").foregroundStyle(UXColor.secondary).font(.system(size: 22)))
                    }, detail: "Completed")
                    smallCard(tag: "Social Proof", tagColor: UXColor.primary, title: "The Bandwagon Effect", trailing: {
                        AnyView(ZStack {
                            Circle().stroke(UXColor.outline, lineWidth: 1).frame(width: 32, height: 32)
                            Image(systemName: "arrow.right").font(.system(size: 12)).foregroundStyle(UXColor.onSurface)
                        })
                    }, detail: "80% Read")
                }
                .padding(.horizontal, 24)
            }
        }
    }

    private func smallCard(tag: String, tagColor: Color, title: String, trailing: () -> AnyView, detail: String) -> some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(tag.uppercased())
                .font(.system(size: 10, weight: .bold))
                .tracking(1)
                .foregroundStyle(tagColor)
                .padding(.bottom, 8)
            Text(title)
                .font(UXFont.headline(18))
                .foregroundStyle(UXColor.onSurface)
                .padding(.bottom, 16)
            HStack {
                Text(detail).font(.system(size: 12)).foregroundStyle(UXColor.onSurfaceVariant)
                Spacer()
                trailing()
            }
        }
        .padding(24)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 32))
        .shadow(color: .black.opacity(0.05), radius: 4, x: 0, y: 2)
    }

    private var statsSection: some View {
        HStack(spacing: 0) {
            statItem(label: "READING STREAK", value: "12 Days", valueColor: UXColor.secondaryFixed)
            statItem(label: "PAGES CONSUMED", value: "428", valueColor: .white)
            statItem(label: "INSIGHTS SAVED", value: "89", valueColor: .white)
        }
        .padding(32)
        .background(Color(hex: "18181b"))
        .clipShape(RoundedRectangle(cornerRadius: 40))
        .padding(.horizontal, 24)
    }

    private func statItem(label: String, value: String, valueColor: Color) -> some View {
        VStack(spacing: 4) {
            Text(label)
                .font(.system(size: 10, weight: .bold))
                .tracking(1.5)
                .foregroundStyle(Color(hex: "9ca3af"))
            Text(value)
                .font(UXFont.headline(32))
                .foregroundStyle(valueColor)
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    ProfileMasteryView()
}
