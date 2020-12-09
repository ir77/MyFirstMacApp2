//
//  WorkspaceObserver.swift
//  MyFirstMacApp2
//
//  Created by ucuc on 2020/12/09.
//

import Cocoa

final class WorkspaceObserver {
    static let shared = WorkspaceObserver()

    private let workspace = NSWorkspace.shared
    private(set) var frontmostApplication: NSRunningApplication?

    private init() {
        workspace.notificationCenter.addObserver(
            self,
            selector: #selector(workspaceDidActivateApplicationNotification),
            name: NSWorkspace.didActivateApplicationNotification,
            object: nil
        )
    }

    @objc private func workspaceDidActivateApplicationNotification() {
        let nextFrontmostApplication = workspace.frontmostApplication
        guard nextFrontmostApplication?.bundleIdentifier != Bundle.main.bundleIdentifier else {
            return
        }
        frontmostApplication = nextFrontmostApplication
    }
}
