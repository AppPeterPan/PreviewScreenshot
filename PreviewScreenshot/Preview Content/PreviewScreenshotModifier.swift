//
//  PreviewScreenshotModifier.swift
//  PreviewScreenshot
//
//  Created by Peter Pan on 2023/2/4.
//

import SwiftUI

struct PreviewScreenshotModifier: ViewModifier {
    let screenshotDirectoryURL = URL(filePath: "/Users/peterpan/Desktop/preview/")
    let tapCount = 3
    
    func body(content: Content) -> some View {
        content
            .onTapGesture(count: tapCount, perform: {
                print("screenshot")
                let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene
                let window = scene?.keyWindow ?? UIWindow(frame: .zero)
                let renderer = UIGraphicsImageRenderer(size: window.bounds.size)
                let image = renderer.image { context in
                    window.drawHierarchy(in: window.bounds, afterScreenUpdates: true)
                }
                let screenshotURL = screenshotDirectoryURL.appending(path: "\(UUID())").appendingPathExtension(for: .png)
                try? image.pngData()?.write(to: screenshotURL)
            })
    }
}

extension View {
    func previewScreenshot() -> some View {
        modifier(PreviewScreenshotModifier())
    }
}

struct Previews_PreviewScreenshotModifier_LibraryContent: LibraryContentProvider {
    
    func modifiers(base: any View) -> [LibraryItem] {
        LibraryItem(base.previewScreenshot())
    }
}
