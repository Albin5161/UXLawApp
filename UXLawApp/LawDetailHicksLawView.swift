import SwiftUI

struct LawDetailHicksLawView: View {
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                heroSection
                definitionSection
                comparisonSection
                ctaSection
                quoteSection
            }
            .padding(.bottom, 100)
        }
        .background(UXColor.background)
        .safeAreaInset(edge: .top, spacing: 0) { topBar }
        .toolbar(.hidden, for: .navigationBar)
        .overlay(alignment: .bottom) { practiceButton }
    }

    private var topBar: some View {
        HStack {
            Button { dismiss() } label: {
                Image(systemName: "chevron.left")
                    .font(.system(size: 18, weight: .medium))
                    .foregroundStyle(UXColor.primary)
                    .padding(8)
            }
            Spacer()
            Text("UX Psychology")
                .font(UXFont.headline(20))
                .foregroundStyle(Color(hex: "18181b"))
            Spacer()
            Image(systemName: "magnifyingglass")
                .foregroundStyle(UXColor.primary)
                .font(.system(size: 20))
                .padding(8)
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 16)
        .background(Color.white)
        .overlay(alignment: .bottom) { Divider() }
    }

    private var heroSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("COGNITIVE LOAD")
                .font(UXFont.labelCaps())
                .tracking(2)
                .foregroundStyle(UXColor.onSecondaryFixed)
            Text("Hick's Law")
                .font(UXFont.display(48))
                .foregroundStyle(UXColor.onSecondaryFixed)
            Text("The time it takes to make a decision increases with the number and complexity of choices. In UX, complexity is the enemy of action.")
                .font(UXFont.body())
                .foregroundStyle(UXColor.onSecondaryFixed.opacity(0.85))
                .frame(maxWidth: 420, alignment: .leading)
        }
        .padding(.horizontal, 24)
        .padding(.vertical, 48)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(UXColor.secondaryContainer)
    }

    private var definitionSection: some View {
        VStack(spacing: 32) {
            VStack(alignment: .leading, spacing: 16) {
                Text("The formula for focus.")
                    .font(UXFont.headline(32))
                    .foregroundStyle(UXColor.onSurface)
                Text("Developed by psychologists William Edmund Hick and Ray Hyman, the law states that users become overwhelmed when faced with too many options, leading to \"analysis paralysis.\"")
                    .font(UXFont.body())
                    .foregroundStyle(UXColor.onSurfaceVariant)
                Text("Decision Time = b · log₂(n + 1)")
                    .font(UXFont.labelCaps())
                    .tracking(1.5)
                    .foregroundStyle(UXColor.background)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 8)
                    .background(UXColor.onSurface)
                    .clipShape(Capsule())
            }

            AsyncImage(url: URL(string: "https://lh3.googleusercontent.com/aida-public/AB6AXuBlXyC923PCiDzaZLQsBSdaGhzrQzW8d-63Bq6Q6EzhD2pZQHZqaeTpZhwWdxJljUYRkCcs_MUjGWR6M19LDL_pfbZKZSretMwd-_oajPQ6LZ57xqS9CIAwXecF_3xlWJn_bZz7-xjt6-kmkhMX0F9esOa6udB0SnTf3i4Rs3X71GCsq0ueEgplDXARfWOz4etZo_zC1rYxMWSNK_AtJQQwM9Q6KfgbjL0q081nVwLCDBJ241gUl3M27yp_CfJKi2aErgChrW_LrcY")) { phase in
                if let img = phase.image { img.resizable().scaledToFill() }
                else { Rectangle().fill(UXColor.surfaceContainerHighest) }
            }
            .frame(maxWidth: .infinity)
            .frame(height: 200)
            .clipShape(RoundedRectangle(cornerRadius: 24))
        }
        .padding(.horizontal, 24)
        .padding(.vertical, 48)
    }

    private var comparisonSection: some View {
        VStack(spacing: 24) {
            Text("Comparing User Journeys")
                .font(UXFont.sectionHeader())
                .foregroundStyle(UXColor.onSurface)
                .multilineTextAlignment(.center)

            HStack(alignment: .top, spacing: 16) {
                // Anti-pattern
                VStack(alignment: .leading, spacing: 0) {
                    HStack(spacing: 8) {
                        Image(systemName: "slash.circle")
                            .foregroundStyle(Color(hex: "ba1a1a"))
                        Text("THE ANTI-PATTERN")
                            .font(UXFont.labelCaps())
                            .tracking(1)
                            .foregroundStyle(Color(hex: "ba1a1a"))
                    }
                    .padding(.bottom, 12)

                    Text("The \u{201C}Everything\u{201D} Menu")
                        .font(UXFont.headline(20))
                        .foregroundStyle(UXColor.onSurface)
                        .padding(.bottom, 8)
                    Text("Presenting 20+ navigation links in a single top-level menu forces the user to scan every item, increasing the risk of exit.")
                        .font(.system(size: 13))
                        .foregroundStyle(UXColor.onSurfaceVariant)
                        .padding(.bottom, 16)

                    VStack(spacing: 6) {
                        ForEach(["Settings", "Profile", "Security", "Privacy", "Notifications"], id: \.self) { item in
                            Text(item)
                                .font(.system(size: 10))
                                .foregroundStyle(Color(hex: "a1a1aa"))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.horizontal, 12)
                                .frame(height: 32)
                                .background(Color(hex: "f4f4f5"))
                                .clipShape(RoundedRectangle(cornerRadius: 6))
                        }
                        Text("...and 15 more items")
                            .font(.system(size: 10))
                            .italic()
                            .foregroundStyle(Color(hex: "a1a1aa"))
                            .frame(maxWidth: .infinity)
                            .multilineTextAlignment(.center)
                    }
                }
                .padding(24)
                .frame(maxWidth: .infinity)
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 24))
                .overlay(RoundedRectangle(cornerRadius: 24).stroke(Color(hex: "e4e4e7"), lineWidth: 1))

                // Ideal flow
                VStack(alignment: .leading, spacing: 0) {
                    HStack(spacing: 8) {
                        Image(systemName: "checkmark.circle")
                            .foregroundStyle(UXColor.onPrimary)
                        Text("THE IDEAL FLOW")
                            .font(UXFont.labelCaps())
                            .tracking(1)
                            .foregroundStyle(UXColor.onPrimary.opacity(0.8))
                    }
                    .padding(.bottom, 12)

                    Text("Progressive Disclosure")
                        .font(UXFont.headline(20))
                        .foregroundStyle(.white)
                        .padding(.bottom, 8)
                    Text("Categorize options into logical groups. Reveal only what is necessary at each step to maintain momentum.")
                        .font(.system(size: 13))
                        .foregroundStyle(UXColor.onPrimaryContainer.opacity(0.9))
                        .padding(.bottom, 16)

                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 8) {
                        ForEach([("person", "Account"), ("lock", "Privacy")], id: \.0) { item in
                            VStack(spacing: 6) {
                                Image(systemName: item.0).font(.system(size: 20)).foregroundStyle(.white)
                                Text(item.1).font(.system(size: 10, weight: .bold)).foregroundStyle(.white)
                            }
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 16)
                            .background(Color.white.opacity(0.1))
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                            .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color.white.opacity(0.2), lineWidth: 1))
                        }
                    }
                }
                .padding(24)
                .frame(maxWidth: .infinity)
                .background(UXColor.primary)
                .clipShape(RoundedRectangle(cornerRadius: 24))
                .shadow(color: UXColor.primary.opacity(0.3), radius: 12, x: 0, y: 6)
            }
        }
        .padding(.horizontal, 24)
        .padding(.vertical, 48)
        .background(UXColor.surfaceContainerLow)
    }

    private var ctaSection: some View {
        VStack(spacing: 24) {
            Text("Ready to apply this?")
                .font(UXFont.headline(32))
                .foregroundStyle(UXColor.onTertiaryContainer)
                .multilineTextAlignment(.center)
            Text("Use our interactive simulator to see how removing a single choice can increase your conversion rate by up to 15%.")
                .font(UXFont.body())
                .foregroundStyle(UXColor.onTertiaryContainer.opacity(0.9))
                .multilineTextAlignment(.center)
                .frame(maxWidth: 320)
            Button("TEST THE THEORY") {}
                .font(UXFont.labelCaps())
                .tracking(2)
                .foregroundStyle(.white)
                .padding(.horizontal, 40)
                .padding(.vertical, 16)
                .background(Color.black)
                .clipShape(Capsule())
                .overlay(Capsule().stroke(Color.black, lineWidth: 2))
        }
        .padding(32)
        .frame(maxWidth: .infinity)
        .background(Color(hex: "b84b20"))
        .clipShape(RoundedRectangle(cornerRadius: 24))
        .padding(.horizontal, 24)
        .padding(.vertical, 48)
    }

    private var quoteSection: some View {
        VStack(spacing: 16) {
            Divider()
            Text("\u{201C}Simplicity is not the absence of clutter, that\u{2019}s a consequence of simplicity.\u{201D}")
                .font(UXFont.headline(32))
                .foregroundStyle(UXColor.outline)
                .multilineTextAlignment(.center)
            Text("— JONY IVE")
                .font(UXFont.labelCaps())
                .tracking(2)
                .foregroundStyle(Color(hex: "71717a"))
        }
        .padding(.horizontal, 24)
        .padding(.vertical, 48)
    }

    private var practiceButton: some View {
        HStack(spacing: 12) {
            Image(systemName: "flask")
                .foregroundStyle(UXColor.background)
            Text("PRACTICE MODULE")
                .font(UXFont.labelCaps())
                .tracking(1.5)
                .foregroundStyle(UXColor.background)
        }
        .padding(.horizontal, 32)
        .padding(.vertical, 16)
        .background(UXColor.onSurface)
        .clipShape(Capsule())
        .shadow(color: .black.opacity(0.25), radius: 16, x: 0, y: 8)
        .padding(.bottom, 32)
    }
}

#Preview {
    NavigationStack {
        LawDetailHicksLawView()
    }
}
