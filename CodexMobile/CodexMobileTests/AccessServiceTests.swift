// FILE: AccessServiceTests.swift
// Purpose: Verifies local-first builds keep app access available.
// Layer: Unit Test
// Exports: AccessServiceTests
// Depends on: XCTest, CodexMobile

import XCTest
@testable import CodexMobile

@MainActor
final class AccessServiceTests: XCTestCase {
    func testLocalBuildStartsReadyWithAppAccess() {
        let service = AccessService()

        XCTAssertEqual(service.bootstrapState, .ready)
        XCTAssertTrue(service.hasAppAccess)
    }

    func testBootstrapKeepsAppAccessReady() async {
        let service = AccessService()

        await service.bootstrap()

        XCTAssertEqual(service.bootstrapState, .ready)
        XCTAssertTrue(service.hasAppAccess)
    }
}
