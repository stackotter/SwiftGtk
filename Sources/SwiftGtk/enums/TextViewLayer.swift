import CGtk

/// Used to reference the layers of `GtkTextView` for the purpose of customized drawing with the ::draw_layer vfunc.
/// 
/// [Gtk docs](https://docs.gtk.org/gtk3/enum.TextViewLayer.html)
public enum TextViewLayer {
    /// Old deprecated layer, use GTK_TEXT_VIEW_LAYER_BELOW_TEXT instead.
    case below
    /// Old deprecated layer, use GTK_TEXT_VIEW_LAYER_ABOVE_TEXT instead.
    case above
    /// The layer rendered below the text (but above the background). Since: 3.20
    case belowText
    /// The layer rendered above the text. Since: 3.20
    case aboveText

    func toGtkTextViewLayer() -> GtkTextViewLayer {
        switch self {
        case .below:
            return GTK_TEXT_VIEW_LAYER_BELOW
        case .above:
            return GTK_TEXT_VIEW_LAYER_ABOVE
        case .belowText:
            return GTK_TEXT_VIEW_LAYER_BELOW_TEXT
        case .aboveText:
            return GTK_TEXT_VIEW_LAYER_ABOVE_TEXT
        }
    }
}

extension GtkTextViewLayer {
    func toTextViewLayer() -> TextViewLayer {
        switch self {
        case GTK_TEXT_VIEW_LAYER_BELOW:
            return .below
        case GTK_TEXT_VIEW_LAYER_ABOVE:
            return .above
        case GTK_TEXT_VIEW_LAYER_BELOW_TEXT:
            return .belowText
        case GTK_TEXT_VIEW_LAYER_ABOVE_TEXT:
            return .aboveText
        default:
            fatalError("Unexpected enum value")
        }
    }
}
