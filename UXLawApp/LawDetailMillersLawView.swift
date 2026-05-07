import SwiftUI

struct LawDetailMillersLawView: View {
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                heroSection
                ruleSection
                implementationSection
                quoteSection
                imageSection
            }
            .padding(.bottom, 100)
        }
        .background(UXColor.background)
        .ignoresSafeArea(edges: .top)
        .safeAreaInset(edge: .top, spacing: 0) { topBar }
        .toolbar(.hidden, for: .navigationBar)
    }

    private var topBar: some View {
        HStack(spacing: 16) {
            Button { dismiss() } label: {
                Image(systemName: "arrow.left")
                    .font(.system(size: 20))
                    .foregroundStyle(Color(hex: "18181b"))
                    .padding(8)
                    .background(Color.white.opacity(0.9))
                    .clipShape(Circle())
            }
            Text("UX Psychology")
                .font(UXFont.headline(24))
                .foregroundStyle(Color(hex: "18181b"))
            Spacer()
            Image(systemName: "magnifyingglass")
                .foregroundStyle(UXColor.primary)
                .padding(8)
            AsyncImage(url: URL(string: "https://lh3.googleusercontent.com/aida-public/AB6AXuCHu8lMJpnqLQUj6jLFcoSC5TBHBQR6mvtOwBN2Iw4v0KBT0298x-GM4Mm0EjLqiet6qMoMiiPYY5B2R45MoGrSv7Xz_cL5e5WdpDpwv1Xva3PvoK-oJa3qQnvvIf3_Z6ZlKHk8xk37gkh-gKseEkcX3nGW1N9ZdftTJDWCrwVSWuSvbQi1lmo5OvAgrvlcRhlw4tz9saHhEoGMPElnmar4gNpbk_jCo_2Es73sWiVgBVCPeQ4XQZ0kpyPsizGUIwWE8SCAxCxYyKo")) { phase in
                if let img = phase.image { img.resizable().scaledToFill() }
                else { Circle().fill(UXColor.surfaceContainerHigh) }
            }
            .frame(width: 32, height: 32)
            .clipShape(Circle())
        }
        .padding(.horizontal, 24)
        .padding(.vertical, 16)
        .background(Color.white.overlay(alignment: .bottom) { Divider() })
    }

    private var heroSection: some View {
        ZStack(alignment: .bottomLeading) {
            UXColor.brandCoral
            VStack(alignment: .leading, spacing: 16) {
                HStack(spacing: 8) {
                    Text("COGNITIVE LOAD")
                        .font(UXFont.labelCaps())
                        .tracking(1)
                        .foregroundStyle(.white)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 4)
                        .background(Color.white.opacity(0.2))
                        .clipShape(Capsule())
                    Text("8 MIN READ")
                        .font(UXFont.labelCaps())
                        .tracking(1)
                        .foregroundStyle(.white.opacity(0.8))
                }
                Text("Miller's Law")
                    .font(UXFont.display(48))
                    .foregroundStyle(.white)
                Text("The average person can only keep 7 (plus or minus 2) items in their working memory.")
                    .font(UXFont.body())
                    .foregroundStyle(.white.opacity(0.9))
                    .frame(maxWidth: 340, alignment: .leading)
            }
            .padding(.horizontal, 24)
            .padding(.top, 120)
            .padding(.bottom, 48)
        }
    }

    private var ruleSection: some View {
        VStack(alignment: .leading, spacing: 24) {
            Text("The 7 ± 2 Rule")
                .font(UXFont.sectionHeader())
                .foregroundStyle(UXColor.onSurface)

            VStack(alignment: .leading, spacing: 16) {
                Text("In 1956, George Miller asserted that the span of immediate memory and absolute judgment were both limited to around seven pieces of information.")
                    .font(UXFont.body())
                    .foregroundStyle(UXColor.onSurfaceVariant)

                Text("In UX design, this means we should categorize information into manageable chunks. When users are presented with too many options, their cognitive load spikes, leading to frustration and decision paralysis.")
                    .font(UXFont.body())
                    .foregroundStyle(UXColor.onSurfaceVariant)

                VStack(alignment: .leading, spacing: 12) {
                    HStack(spacing: 8) {
                        ForEach(1...7, id: \.self) { n in
                            ZStack {
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(UXColor.primary.opacity(0.15))
                                    .frame(width: 40, height: 40)
                                Text("\(n)")
                                    .font(.system(size: 15, weight: .bold))
                                    .foregroundStyle(UXColor.primary)
                            }
                        }
                    }
                    Text("THE MAGIC NUMBER")
                        .font(UXFont.labelCaps())
                        .tracking(1.5)
                        .foregroundStyle(UXColor.outline)
                }
                .padding(20)
                .background(UXColor.surfaceContainer)
                .clipShape(RoundedRectangle(cornerRadius: 24))
                .overlay(RoundedRectangle(cornerRadius: 24).stroke(UXColor.outlineVariant.opacity(0.3), lineWidth: 1))
            }
        }
        .padding(.horizontal, 24)
        .padding(.vertical, 48)
    }

    private var implementationSection: some View {
        VStack(spacing: 24) {
            Text("Implementation Strategies")
                .font(UXFont.sectionHeader())
                .foregroundStyle(UXColor.onSurface)
                .multilineTextAlignment(.center)

            HStack(alignment: .top, spacing: 16) {
                strategyCard(
                    isGood: false,
                    header: "Anti-pattern",
                    description: "Presenting 10+ disparate items in a single list without hierarchy or grouping causes mental fatigue."
                )
                strategyCard(
                    isGood: true,
                    header: "Ideal Flow",
                    description: "Chunking content into groups of 3-4 items makes the interface feel organized and breathable."
                )
            }
        }
        .padding(.horizontal, 24)
        .padding(.vertical, 48)
        .background(UXColor.surfaceContainerLow)
    }

    private func strategyCard(isGood: Bool, header: String, description: String) -> some View {
        let accent = isGood ? UXColor.secondary : Color(hex: "ba1a1a")
        return VStack(alignment: .leading, spacing: 0) {
            HStack(spacing: 8) {
                Image(systemName: isGood ? "checkmark.circle.fill" : "xmark.circle.fill")
                    .foregroundStyle(accent)
                Text(header.uppercased())
                    .font(UXFont.labelCaps())
                    .tracking(1)
                    .foregroundStyle(accent)
            }
            .padding(16)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(accent.opacity(0.05))
            .overlay(alignment: .bottom) { Divider().background(accent.opacity(0.1)) }

            VStack(alignment: .leading, spacing: 16) {
                if isGood {
                    VStack(spacing: 12) {
                        ForEach(0..<2) { _ in
                            VStack(alignment: .leading, spacing: 6) {
                                RoundedRectangle(cornerRadius: 4).fill(UXColor.secondary.opacity(0.3)).frame(width: 48, height: 8)
                                HStack(spacing: 8) {
                                    ForEach(0..<3) { _ in
                                        RoundedRectangle(cornerRadius: 6).fill(UXColor.surfaceContainerHighest).frame(width: 32, height: 32)
                                    }
                                }
                            }
                        }
                    }
                } else {
                    VStack(spacing: 6) {
                        ForEach([CGFloat(1), 1, 0.9, 0.95, 0.85, 1, 0.9, 0.95, 0.8, 0.7], id: \.self) { w in
                            GeometryReader { geo in
                                RoundedRectangle(cornerRadius: 4)
                                    .fill(UXColor.surfaceContainerHighest)
                                    .frame(width: geo.size.width * w, height: 12)
                            }
                            .frame(height: 12)
                        }
                    }
                }
                Text(description)
                    .font(.system(size: 13))
                    .foregroundStyle(UXColor.onSurfaceVariant)
            }
            .padding(20)
        }
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 24))
        .overlay(RoundedRectangle(cornerRadius: 24).stroke(accent.opacity(0.2), lineWidth: 1))
    }

    private var quoteSection: some View {
        VStack(spacing: 16) {
            Image(systemName: "quote.opening")
                .font(.system(size: 36))
                .foregroundStyle(UXColor.primary.opacity(0.2))

            Text("\u{201C}The organization of information is just as important as the information itself.\u{201D}")
                .font(UXFont.headline(22))
                .foregroundStyle(UXColor.onSurface)
                .multilineTextAlignment(.center)

            Text("— GEORGE MILLER")
                .font(UXFont.labelCaps())
                .tracking(1.5)
                .foregroundStyle(UXColor.outline)
        }
        .padding(.horizontal, 24)
        .padding(.vertical, 48)
        .frame(maxWidth: .infinity)
    }

    private var imageSection: some View {
        ZStack(alignment: .bottomLeading) {
            AsyncImage(url: URL(string: "https://lh3.googleusercontent.com/aida-public/AB6AXuAGAnpjgWTQwFT2tinmDlOQS2D_xNAg86epq0E54sOlXREMVjt2pePtzsAd9yK40A6oSZKQoAsmduNN8c-ikgTLLFK6Ui0WYs8b-8MqOyILW6LYLjL9EV-QZ8xT_oazEm_Tlj3NjbglVW0XWN8kaAIpyvrRfOLxl8TBwEQAiSLFXXwh4TuNirijljrw16gBMekUHbGx0euHUkhX6GbNvJsU6Y-WQWIBZrsB298AiIBx8N9yk3SetgH0tROBGwpKrjDCwGFvQ97dMeY")) { phase in
                if let img = phase.image {
                    img.resizable().scaledToFill().grayscale(1)
                } else {
                    Rectangle().fill(UXColor.surfaceContainerHigh)
                }
            }
            .frame(maxWidth: .infinity)
            .frame(height: 220)
            .clipped()

            LinearGradient(colors: [.black.opacity(0.6), .clear], startPoint: .bottom, endPoint: .top)

            VStack(alignment: .leading, spacing: 4) {
                Text("VISUAL ANALOGY")
                    .font(UXFont.labelCaps())
                    .tracking(1.5)
                    .foregroundStyle(.white)
                Text("Organizing physical tools reduces physical reach; organizing digital tools reduces cognitive reach.")
                    .font(.system(size: 13))
                    .foregroundStyle(.white.opacity(0.8))
            }
            .padding(24)
        }
        .clipShape(RoundedRectangle(cornerRadius: 32))
        .padding(.horizontal, 24)
        .padding(.bottom, 48)
    }
}

#Preview {
    NavigationStack {
        LawDetailMillersLawView()
    }
}
