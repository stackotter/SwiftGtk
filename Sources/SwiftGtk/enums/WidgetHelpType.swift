import CGtk

/// Kinds of widget-specific help. Used by the ::show-help signal.
/// 
/// https://docs.gtk.org/gtk3/enum.WidgetHelpType.html
public enum WidgetHelpType {
    /// Tooltip.
    case tooltip

    /// What’s this.
    case whatsThis

    func toGtkWidgetHelpType() -> GtkWidgetHelpType {
        switch self {
        case .tooltip:
            return GTK_WIDGET_HELP_TOOLTIP
        case .whatsThis:
            return GTK_WIDGET_HELP_WHATS_THIS
        }
    }
}

extension GtkWidgetHelpType {
    func toWidgetHelpType() -> WidgetHelpType? {
        switch self {
        case GTK_WIDGET_HELP_TOOLTIP:
            return .tooltip
        case GTK_WIDGET_HELP_WHATS_THIS:
            return .whatsThis
        default:
            return nil
        }
    }
}
