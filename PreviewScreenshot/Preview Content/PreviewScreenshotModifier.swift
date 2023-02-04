//
//  PreviewScreenshotModifier.swift
//  PreviewScreenshot
//
//  Created by Peter Pan on 2023/2/4.
//

import SwiftUI

struct PreviewScreenshotModifier: ViewModifier {
    let screenshotDirectoryURL = URL(filePath: "/Users/peterpan/Desktop/preview/")

    func body(content: Content) -> some View {
        content
            .onTapGesture(count: 3, perform: {
                let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene
                let window = scene?.keyWindow ?? UIWindow(frame: .zero)
                let renderer = UIGraphicsImageRenderer(size: window.bounds.size)
                let image = renderer.image { context in
                    window.drawHierarchy(in: window.bounds, afterScreenUpdates: true)
                }
                let pngData = image.pngData()
                let screenshotURL = screenshotDirectoryURL.appending(path: "\(UUID())").appendingPathExtension(for: .png)
                do {
                    try pngData?.write(to: screenshotURL)
                } catch {
                    print(error)
                }
            })
    }
}

extension View {
    func previewScreenshot() -> some View {
        modifier(PreviewScreenshotModifier())
    }
}
