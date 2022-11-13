//
//  Copyright © 2015 Tomas Linhart. All rights reserved.
//

import CGtk

public class Label: Widget {
    public init(text: String? = nil) {
        super.init()
        if let text = text {
            widgetPointer = gtk_label_new(text)
        } else {
            widgetPointer = gtk_label_new(nil)
        }
    }

    public var text: String? {
        get {
            return String(cString: gtk_label_get_text(castedPointer()))
        }
        set {
            if let text = newValue {
                gtk_label_set_text(castedPointer(), text)
            } else {
                gtk_label_set_text(castedPointer(), nil)
            }
        }
    }

    public var selectable: Bool {
        get {
            return gtk_label_get_selectable(castedPointer()) == 1
        }
        set {
            gtk_label_set_selectable(castedPointer(), newValue ? 1 : 0)
        }
    }

    public var justification: Justification {
        get {
            return gtk_label_get_justify(castedPointer()).toJustification()
        }
        set {
            gtk_label_set_justify(castedPointer(), newValue.toGtkJustification())
        }
    }

    public var horizontalAlignment: Align {
        get {
            return gtk_widget_get_halign(castedPointer()).toAlign()
        }
        set {
            gtk_widget_set_halign(castedPointer(), newValue.toGtkAlign())
        }
    }

    public var verticalAlignment: Align {
        get {
            return gtk_widget_get_valign(castedPointer()).toAlign()
        }
        set {
            gtk_widget_set_valign(castedPointer(), newValue.toGtkAlign())
        }
    }
}
