//
//  SoftwareModelTests.swift
//  DemoAppTests
//
//  Created by 黄瑞 on 2023/2/20.
//

import XCTest
@testable import DemoApp

final class SoftwareModelTests: XCTestCase {

    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
    }

    func testFromJson() throws {
        do {
            guard let jsonUrl = Bundle.main.url(forResource: "Software.json", withExtension: nil) else {
                XCTAssert(false, "找不到 fixture 文件")
                return
            }
            let data = try Data(contentsOf: jsonUrl)
            let software = try Software.fromJson(data: data)
            XCTAssertEqual(software.trackId, 1163852619)
            XCTAssertEqual(software.trackCensoredName, "Google Chat")
            XCTAssertEqual(software.artistName, "Google LLC")
            XCTAssertEqual(software.artworkUrl100, "https://is5-ssl.mzstatic.com/image/thumb/Purple116/v4/89/1e/02/891e02c0-899e-9e13-df65-c3655a15de83/logo_chat_2020q4_color-0-1x_U007emarketing-0-0-0-6-0-0-0-85-220-0.png/100x100bb.jpg")
            XCTAssertEqual(software.description, "Google Chat is an intelligent and secure communication and collaboration tool, built for teams. From ad-hoc messaging to topic-based workstream collaboration, Chat makes it easy to get work done where the conversation is happening.\n\n• Group collaboration that allows Google Workspace content creation and sharing (Docs, Sheets, Slides), without having to worry about granting permissions\n• Side by side editors, one click meetings, scheduling, document creation, and shared files, tasks, and events make it easy to get work done\n• Google search functionality, with options to filter for conversations and content that you’ve shared\n• Ready for Enterprise, with the full benefits of Google Workspace security and access controls including Data Loss Prevention, Compliance, Admin Settings, Vault Retention, Holds, Search, and Export")
        } catch {
            XCTAssert(false, error.localizedDescription)
        }
    }

    func testToJson() throws {
        let jsonString = """
{\"artistName\":\"Google LLC\",\"artworkUrl100\":\"https:\\/\\/is5-ssl.mzstatic.com\\/image\\/thumb\\/Purple116\\/v4\\/89\\/1e\\/02\\/891e02c0-899e-9e13-df65-c3655a15de83\\/logo_chat_2020q4_color-0-1x_U007emarketing-0-0-0-6-0-0-0-85-220-0.png\\/100x100bb.jpg\",\"isLike\":false,\"description\":\"Google Chat is an intelligent and secure communication and collaboration tool, built for teams. From ad-hoc messaging to topic-based workstream collaboration, Chat makes it easy to get work done where the conversation is happening.\\n\\n• Group collaboration that allows Google Workspace content creation and sharing (Docs, Sheets, Slides), without having to worry about granting permissions\\n• Side by side editors, one click meetings, scheduling, document creation, and shared files, tasks, and events make it easy to get work done\\n• Google search functionality, with options to filter for conversations and content that you’ve shared\\n• Ready for Enterprise, with the full benefits of Google Workspace security and access controls including Data Loss Prevention, Compliance, Admin Settings, Vault Retention, Holds, Search, and Export\",\"trackId\":1163852619,\"trackCensoredName\":\"Google Chat\"}
"""
        guard let jsonUrl = Bundle.main.url(forResource: "Software.json", withExtension: nil) else {
            XCTAssert(false, "找不到 fixture 文件")
            return
        }
        do {
            let data = try Data(contentsOf: jsonUrl)
            let software = try Software.fromJson(data: data)
            let newData = try software.toJson()
            let newJsonString = String(data: newData, encoding: .utf8)!
            XCTAssertTrue(jsonString == newJsonString)
        } catch {
            XCTAssertTrue(false)
        }
    }
}
