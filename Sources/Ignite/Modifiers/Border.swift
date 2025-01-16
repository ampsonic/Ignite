//
// Border.swift
// Ignite
// https://www.github.com/twostraws/Ignite
// See LICENSE for license information.
//

/// A modifier that applies border styling to HTML elements.
struct BorderModifier: HTMLModifier {
    /// The color of the border.
    var color: Color

    /// The width of the border in pixels.
    var width: Double

    /// The style of the border.
    var style: BorderStyle

    /// The radii for rounding corners.
    var cornerRadii: CornerRadii

    /// Which edges should have borders.
    var edges: Edge

    /// Applies the border styling to the provided HTML content.
    /// - Parameter content: The HTML content to modify
    /// - Returns: The modified HTML content with border styling applied
    func body(content: some HTML) -> any HTML {
        // Apply border styles based on edges
        if edges.contains(.all) {
            content.style("border: \(width)px \(style.rawValue) \(color)")
        } else {
            if edges.contains(.leading) {
                content.style("border-left: \(width)px \(style.rawValue) \(color)")
            }
            if edges.contains(.trailing) {
                content.style("border-right: \(width)px \(style.rawValue) \(color)")
            }
            if edges.contains(.top) {
                content.style("border-top: \(width)px \(style.rawValue) \(color)")
            }
            if edges.contains(.bottom) {
                content.style("border-bottom: \(width)px \(style.rawValue) \(color)")
            }
        }

        // Apply corner radii
        if cornerRadii.topLeading > 0 {
            content.style("border-top-left-radius: \(cornerRadii.topLeading)px")
        }
        if cornerRadii.topTrailing > 0 {
            content.style("border-top-right-radius: \(cornerRadii.topTrailing)px")
        }
        if cornerRadii.bottomLeading > 0 {
            content.style("border-bottom-left-radius: \(cornerRadii.bottomLeading)px")
        }
        if cornerRadii.bottomTrailing > 0 {
            content.style("border-bottom-right-radius: \(cornerRadii.bottomTrailing)px")
        }

        return content
    }
}

public extension HTML {
    /// Adds a border to this element.
    /// - Parameters:
    ///   - color: The color of the border
    ///   - width: The width in pixels
    ///   - style: The border style
    ///   - cornerRadii: The corner rounding radii
    ///   - edges: Which edges should have borders
    /// - Returns: A modified element with the border applied
    func border(
        _ color: Color,
        width: Double = 1,
        style: BorderStyle = .solid,
        cornerRadii: CornerRadii = CornerRadii(),
        edges: Edge = .all
    ) -> some HTML {
        modifier(BorderModifier(
            color: color,
            width: width,
            style: style,
            cornerRadii: cornerRadii,
            edges: edges)
        )
    }
}

public extension InlineHTML {
    /// Adds a border to this element.
    /// - Parameters:
    ///   - color: The color of the border
    ///   - width: The width in pixels
    ///   - style: The border style
    ///   - cornerRadii: The corner rounding radii
    ///   - edges: Which edges should have borders
    /// - Returns: A modified element with the border applied
    func border(
        _ color: Color,
        width: Double = 1,
        style: BorderStyle = .solid,
        cornerRadii: CornerRadii = CornerRadii(),
        edges: Edge = .all
    ) -> some InlineHTML {
        modifier(BorderModifier(
            color: color,
            width: width,
            style: style,
            cornerRadii: cornerRadii,
            edges: edges)
        )
    }
}
