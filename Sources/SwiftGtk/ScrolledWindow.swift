import CGtk

public class ScrolledWindow: Bin {
    public override init() {
        super.init()
        widgetPointer = gtk_scrolled_window_new(nil, nil)
    }

    override func didMoveToParent() {
        super.didMoveToParent()
    }

    public var minimumContentWidth: Int {
        get {
            return Int(gtk_scrolled_window_get_min_content_width(castedPointer()))
        }
        set {
            gtk_scrolled_window_set_min_content_width(castedPointer(), gint(newValue))
        }
    }

    public var maximumContentWidth: Int {
        get {
            return Int(gtk_scrolled_window_get_max_content_width(castedPointer()))
        }
        set {
            gtk_scrolled_window_set_max_content_width(castedPointer(), gint(newValue))
        }
    }

    public var minimumContentHeight: Int {
        get {
            return Int(gtk_scrolled_window_get_min_content_height(castedPointer()))
        }
        set {
            gtk_scrolled_window_set_min_content_height(castedPointer(), gint(newValue))
        }
    }

    public var maximumContentHeight: Int {
        get {
            return Int(gtk_scrolled_window_get_max_content_height(castedPointer()))
        }
        set {
            gtk_scrolled_window_set_max_content_height(castedPointer(), gint(newValue))
        }
    }
}
