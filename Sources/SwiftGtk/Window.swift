//
//  Copyright © 2015 Tomas Linhart. All rights reserved.
//

import CGtk

public class Window: Bin {
    public enum WindowType {
        case topLevel
        case popUp

        fileprivate func toGtkWindowType() -> GtkWindowType {
            switch self {
            case .topLevel:
                return GTK_WINDOW_TOPLEVEL
            case .popUp:
                return GTK_WINDOW_POPUP
            }
        }
    }

    public init(windowType: WindowType = .topLevel) {
        super.init()
        widgetPointer = gtk_window_new(windowType.toGtkWindowType())
    }

    private init(pointer: UnsafeMutablePointer<GtkWidget>) {
        super.init()
        self.widgetPointer = pointer
    }

    public static var rootWindow: Window {
        return Window(pointer: UnsafeMutablePointer<GtkWidget>(gdk_screen_get_root_window(gdk_screen_get_default())))
    }

    public var title: String? {
        get {
            return String(cString: gtk_window_get_title(castedPointer()))
        }
        set {
            if let title = newValue {
                gtk_window_set_title(castedPointer(), title)
            } else {
                gtk_window_set_title(castedPointer(), nil)
            }
        }
    }

    public var defaultSize: Size {
        get {
            var width: gint = 0
            var height: gint = 0
            gtk_window_get_default_size(castedPointer(), &width, &height)

            return Size(width: Int(width), height: Int(height))
        }
        set (size) {
            gtk_window_set_default_size(castedPointer(), gint(size.width), gint(size.height))
        }
    }

    public var resizable: Bool {
        get {
            return gtk_window_get_resizable(castedPointer()).toBool()
        }
        set {
            gtk_window_set_resizable(castedPointer(), newValue.toGBoolean())
        }
    }

    public var hideTitlebarWhenMaximized: Bool {
        get { return gtk_window_get_hide_titlebar_when_maximized(castedPointer()).toBool() }
        set { gtk_window_set_hide_titlebar_when_maximized(castedPointer(), newValue.toGBoolean()) }
    }

    private var _titleBar: Widget?
    public var titlebar: Widget? {
        get { return _titleBar }
        set { gtk_window_set_titlebar(castedPointer(), newValue?.widgetPointer) }
    }
}
