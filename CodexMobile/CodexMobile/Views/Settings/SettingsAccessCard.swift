// FILE: SettingsAccessCard.swift
// Purpose: Presents local-first access status.
// Layer: Settings UI component
// Exports: SettingsAccessCard
// Depends on: SwiftUI, AccessService

import SwiftUI

struct SettingsAccessCard: View {
    @Environment(AccessService.self) private var access

    var body: some View {
        SettingsCard(title: "Access") {
            HStack {
                Text("Status")
                Spacer()
                Text(access.hasAppAccess ? "Enabled" : "Unavailable")
                    .foregroundStyle(access.hasAppAccess ? .green : .secondary)
            }

            Text("All Remodex features are available in this local-first build. No account or subscription check is required.")
                .font(AppFont.caption())
                .foregroundStyle(.secondary)
        }
        .task {
            guard access.bootstrapState == .idle else {
                return
            }
            await access.bootstrap()
        }
    }
}
