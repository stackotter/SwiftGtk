//
//  Copyright © 2015 Tomas Linhart. All rights reserved.
//

import CGtk

public class Window: Bin {

    public init(windowType: WindowType = .topLevel) {
        super.init()
        widgetPointer = gtk_window_new(windowType.toGtkWindowType())
    }

    public var title: String? {
        get { String(cString: gtk_window_get_title(castedPointer())) }
        set { gtk_window_set_title(castedPointer(), newValue) }
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
        get { gtk_window_get_resizable(castedPointer()).toBool() }
        set { gtk_window_set_resizable(castedPointer(), newValue.toGBoolean()) }
    }

    public var hideTitlebarWhenMaximized: Bool {
        get { return gtk_window_get_hide_titlebar_when_maximized(castedPointer()).toBool() }
        set { gtk_window_set_hide_titlebar_when_maximized(castedPointer(), newValue.toGBoolean()) }
    }

    private var _titleBar: Widget?
    public var titlebar: Widget? {
        get { _titleBar }
        set { gtk_window_set_titlebar(castedPointer(), newValue?.widgetPointer) }
    }
}
