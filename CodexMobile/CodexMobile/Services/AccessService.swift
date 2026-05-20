// FILE: AccessService.swift
// Purpose: Provides local-first app access state.
// Layer: Service
// Exports: AccessService
// Depends on: Observation

import Observation

enum AccessBootstrapState: Equatable {
    case idle
    case loading
    case ready
    case failed
}

@MainActor
@Observable
final class AccessService {
    private(set) var bootstrapState: AccessBootstrapState = .ready
    private(set) var hasAppAccess = true

    func bootstrap() async {
        bootstrapState = .ready
        hasAppAccess = true
    }

    func refreshSilently() async {
        await bootstrap()
    }
}
