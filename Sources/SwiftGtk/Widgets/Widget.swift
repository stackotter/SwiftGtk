//
//  Copyright © 2015 Tomas Linhart. All rights reserved.
//

import CGtk

/// GtkWidget is the base class all widgets in GTK+ derive from. It manages the widget lifecycle, states and style.
///
/// [Gtk docs](https://docs.gtk.org/gtk3/class.Widget.html)
open class Widget {

    private var signals: [(UInt, Any)] = []
    var widgetPointer: UnsafeMutablePointer<GtkWidget>?

    public weak var parentWidget: Widget? {
        willSet {

        }
        didSet {
            if parentWidget != nil {
                didMoveToParent()
            } else {
                didMoveFromParent()
                removeSignals()
            }
        }
    }

    init() {
        widgetPointer = nil
    }

    deinit {
        removeSignals()
    }

    func didMoveToParent() {
    }

    func didMoveFromParent() {
    }

    // MARK: Alignment Properties

    /// How to distribute horizontal space if widget gets extra space, see GtkAlign.
    public var horizontalAlignment: Align {
        get { gtk_widget_get_halign(widgetPointer).toAlign() }
        set { gtk_widget_set_halign(widgetPointer, newValue.toGtkAlign()) }
    }

    /// How to distribute vertical space if widget gets extra space, see GtkAlign.
    public var verticalAlignment: Align {
        get { gtk_widget_get_valign(widgetPointer).toAlign() }
        set { gtk_widget_set_valign(widgetPointer, newValue.toGtkAlign()) }
    }

    // MARK: Appearance Properties

    /// Override for height request of the widget, or -1 if natural request should be used.
    public var heightRequest: Int? {
        get {
            let request: Int = getProperty(castedPointer(), name: "height-request")
            return request == -1 ? nil : request
        }
        set {
            guard let request = newValue else {
                setProperty(castedPointer(), name: "height-request", newValue: -1)
                return
            }
            setProperty(castedPointer(), name: "height-request", newValue: request)
        }
    }

    /// Sets the visibility state of widget. Note that setting this to TRUE doesn’t mean the widget is actually viewable, see gtk_widget_get_visible().
    public var isVisible: Bool {
        get { gtk_widget_get_visible(widgetPointer).toBool() }
        set { gtk_widget_set_visible(widgetPointer, newValue.toGBoolean()) }
    }

    /// Sets the GtkWidget:no-show-all property, which determines whether calls to gtk_widget_show_all() will affect this widget.
    public var noShowAll: Bool {
        get { gtk_widget_get_no_show_all(widgetPointer).toBool() }
        set { gtk_widget_set_no_show_all(widgetPointer, newValue.toGBoolean()) }
    }

    /// The requested opacity of the widget. See gtk_widget_set_opacity() for more details about window opacity.
    public var opacity: Double {
        get { gtk_widget_get_opacity(widgetPointer) }
        set { gtk_widget_set_opacity(widgetPointer, newValue) }
    }

    /// The scale factor of the widget. See gtk_widget_get_scale_factor() for more details about widget scaling.
    public var scaleFactor: Int { Int(gtk_widget_get_scale_factor(widgetPointer)) }

    /// Override for width request of the widget, or -1 if natural request should be used.
    public var widthRequest: Int? {
        get {
            let request: Int = getProperty(castedPointer(), name: "width-request")
            return request == -1 ? nil : request
        }
        set {
            guard let request = newValue else {
                setProperty(castedPointer(), name: "width-request", newValue: -1)
                return
            }
            setProperty(castedPointer(), name: "width-request", newValue: request)
        }
    }

    // MARK: Default/Focus Properties

    /// Specifies whether widget can be a default widget. See gtk_widget_grab_default() for details about the meaning of “default”.
    public var canBeDefaultWidget: Bool {
        get { gtk_widget_get_can_default(widgetPointer).toBool() }
        set { gtk_widget_set_can_default(widgetPointer, newValue.toGBoolean()) }
    }

    /// Specifies whether widget can own the input focus. See gtk_widget_grab_focus() for actually setting the input focus on a widget.
    public var canHaveFocus: Bool {
        get { gtk_widget_get_can_focus(widgetPointer).toBool() }
        set { gtk_widget_set_can_focus(widgetPointer, newValue.toGBoolean()) }
    }

    /// Whether the widget has the input focus.
    public var hasFocus: Bool {
        get { getProperty(castedPointer(), name: "has-focus") }
        set { setProperty(castedPointer(), name: "has-focus", newValue: newValue) }
    }

    /// Specifies whether widget will be treated as the default widget within its toplevel when it has the focus, even if another widget is the default.
    public var isDefaultWhenFocused: Bool {
        get { gtk_widget_get_receives_default(widgetPointer).toBool() }
        set { gtk_widget_set_receives_default(widgetPointer, newValue.toGBoolean()) }
    }

    /// Whether the widget is the default widget.
    public var isDefaultWidget: Bool {
        get { getProperty(castedPointer(), name: "has-default") }
        set { setProperty(castedPointer(), name: "has-default", newValue: newValue) }
    }

    /// Whether the widget is the focus widget within the toplevel.
    public var isFocused: Bool {
        get { getProperty(castedPointer(), name: "is-focus") }
        set { setProperty(castedPointer(), name: "is-focus", newValue: newValue) }
    }

    /// Whether the widget should grab focus when it is clicked with the mouse.
    public var shouldFocusOnClick: Bool {
        get { gtk_widget_get_focus_on_click(widgetPointer).toBool() }
        set { gtk_widget_set_focus_on_click(widgetPointer, newValue.toGBoolean()) }
    }

    // MARK: Expansion Properties

    /// Whether to expand horizontally. See gtk_widget_set_hexpand().
    public var shouldExpandHorizontally: Bool {
        get { gtk_widget_get_hexpand(widgetPointer).toBool() }
        set { gtk_widget_set_hexpand(widgetPointer, newValue.toGBoolean()) }
    }

    /// Whether to expand in both directions. Setting this sets both `GtkWidget:hexpand`` and `GtkWidget:vexpand``.
    public var shouldExpandHorizontallyAndVertically: Bool {
        get { getProperty(castedPointer(), name: "expand") }
        set { setProperty(castedPointer(), name: "expand", newValue: newValue) }
    }

    /// Whether to expand vertically. See gtk_widget_set_vexpand().
    public var shouldExpandVertically: Bool {
        get { gtk_widget_get_vexpand(widgetPointer).toBool() }
        set { gtk_widget_set_vexpand(widgetPointer, newValue.toGBoolean()) }
    }

    /// Whether to use the GtkWidget:hexpand property. See gtk_widget_get_hexpand_set().
    public var shouldUseHorizontalExpand: Bool {
        get { gtk_widget_get_hexpand_set(widgetPointer).toBool() }
        set { gtk_widget_set_hexpand_set(widgetPointer, newValue.toGBoolean()) }
    }

    /// Whether to use the GtkWidget:vexpand property. See gtk_widget_get_vexpand_set().
    public var shouldUseVerticalExpand: Bool {
        get { gtk_widget_get_vexpand_set(widgetPointer).toBool() }
        set { gtk_widget_set_vexpand_set(widgetPointer, newValue.toGBoolean()) }
    }

    // MARK: Margin Properties

    /// Margin on bottom side of widget.
    public var bottomMargin: Int {
        get { Int(gtk_widget_get_margin_bottom(widgetPointer)) }
        set { gtk_widget_set_margin_bottom(widgetPointer, gint(newValue)) }
    }

    /// Margin on start of widget, horizontally. This property supports left-to-right and right-to-left text directions.
    public var leadingMargin: Int {
        get { Int(gtk_widget_get_margin_start(widgetPointer)) }
        set { gtk_widget_set_margin_start(widgetPointer, gint(newValue)) }
    }

    /// Sets all four sides’ margin at once. If read, returns max margin on any side.
    public var margin: Int {
        get { getProperty(castedPointer(), name: "margin") }
        set { setProperty(castedPointer(), name: "margin", newValue: newValue) }
    }

    /// Margin on top side of widget.
    public var topMargin: Int {
        get { Int(gtk_widget_get_margin_top(widgetPointer)) }
        set { gtk_widget_set_margin_top(widgetPointer, gint(newValue)) }
    }

    /// Margin on end of widget, horizontally. This property supports left-to-right and right-to-left text directions.
    public var trailingMargin: Int {
        get { Int(gtk_widget_get_margin_end(widgetPointer)) }
        set { gtk_widget_set_margin_end(widgetPointer, gint(newValue)) }
    }

    // MARK: Tooltip Properties

    /// Enables or disables the emission of GtkWidget::query-tooltip on widget. A value of TRUE indicates that widget can have a tooltip, in this case the widget will be queried using GtkWidget::query-tooltip to determine whether it will provide a tooltip or not.
    public var hasToolTip: Bool {
        get { gtk_widget_get_has_tooltip(widgetPointer).toBool() }
        set { gtk_widget_set_has_tooltip(widgetPointer, newValue.toGBoolean()) }
    }

    /// Sets the text of tooltip to be the given string, which is marked up with the [Pango text markup language][PangoMarkupFormat]. Also see gtk_tooltip_set_markup().
    public var tooltipMarkup: String? {
        get { gtk_widget_get_tooltip_markup(widgetPointer)?.toString() }
        set { gtk_widget_set_tooltip_markup(widgetPointer, newValue) }
    }

    /// Sets the text of tooltip to be the given string.
    public var tooltipText: String? {
        get { gtk_widget_get_tooltip_text(widgetPointer)?.toString() }
        set { gtk_widget_set_tooltip_text(widgetPointer, newValue) }
    }

    // MARK: Misc Properties

    /// Sets whether the application intends to draw on the widget in an GtkWidget::draw handler.
    public var isAppPaintable: Bool {
        get { gtk_widget_get_app_paintable(widgetPointer).toBool() }
        set { gtk_widget_set_app_paintable(widgetPointer, newValue.toGBoolean()) }
    }

    /// Whether the widget is part of a composite widget.
    public var isCompositeChild: Bool {
        get { getProperty(castedPointer(), name: "composite-child") }
        set { setProperty(castedPointer(), name: "composite-child", newValue: newValue) }
    }

    /// Widgets can be named, which allows you to refer to them from a CSS file. You can apply a style to widgets with a particular name in the CSS file. See the documentation for the CSS syntax (on the same page as the docs for GtkStyleContext).
    public var name: String? {
        get { gtk_widget_get_name(widgetPointer)?.toString() }
        set { gtk_widget_set_name(widgetPointer, newValue) }
    }

    /// Sets the sensitivity of a widget. A widget is sensitive if the user can interact with it. Insensitive widgets are “grayed out” and the user can’t interact with them. Insensitive widgets are known as “inactive”, “disabled”, or “ghosted” in some other toolkits.
    public var isEnabled: Bool {
        get { gtk_widget_get_sensitive(widgetPointer).toBool() }
        set { gtk_widget_set_sensitive(widgetPointer, newValue.toGBoolean()) }
    }

    // TODO: add support for the events property
    // TODO: add support for the parent property
    // TODO: add support for the window property

    // MARK: Public Methods

    /// Reverses the effects of gtk_widget_show(), causing the widget to be hidden (invisible to the user).
    public func hide() {
        gtk_widget_hide(widgetPointer)
    }

    /// Flags a widget to be displayed. Any widget that isn’t shown will not appear on the screen. If you want to show all the widgets in a container, it’s easier to call gtk_widget_show_all() on the container, instead of individually showing the widgets.
    public func show() {
        gtk_widget_show(widgetPointer)
    }

    /// Recursively shows a widget, and any child widgets (if the widget is a container).
    public func showAll() {
        gtk_widget_show_all(widgetPointer)
    }

    /// Shows a widget. If the widget is an unmapped toplevel widget (i.e. a GtkWindow that has not yet been shown), enter the main loop and wait for the window to actually be mapped. Be careful; because the main loop is running, anything can happen during this function.
    public func showNow() {
        gtk_widget_show_now(widgetPointer)
    }

}

// Signals

extension Widget {

    /// Adds a signal that is not carrying any additional information.
    func addSignal(name: String, callback: @escaping SignalCallbackZero) {
        let box = SignalBoxZero(callback: callback)
        let handler: @convention(c) (UnsafeMutableRawPointer, UnsafeMutableRawPointer) -> Void = { sender, data in
            let box = unsafeBitCast(data, to: SignalBoxZero.self)
            box.callback()
        }

        let handlerId = connectSignal(widgetPointer, name: name, data: Unmanaged.passUnretained(box).toOpaque(), handler: unsafeBitCast(handler, to: GCallback.self))

        signals.append((handlerId, box))
    }

    func addSignal(name: String, callback: @escaping SignalCallbackOne) {
        let box = SignalBoxOne(callback: callback)
        let handler: @convention(c) (UnsafeMutableRawPointer, UnsafeMutableRawPointer, UnsafeMutableRawPointer) -> Void = { sender, pointer, data in
            let box = unsafeBitCast(data, to: SignalBoxOne.self)
            box.callback(pointer)
        }

        let handlerId = connectSignal(widgetPointer, name: name, data: Unmanaged.passUnretained(box).toOpaque(), handler: unsafeBitCast(handler, to: GCallback.self))

        signals.append((handlerId, box))
    }

    func addSignal(name: String, callback: @escaping SignalCallbackTwo) {
        let box = SignalBoxTwo(callback: callback)
        let handler: @convention(c) (UnsafeMutableRawPointer, UnsafeMutableRawPointer, UnsafeMutableRawPointer, UnsafeMutableRawPointer) -> Void = { sender, pointer1, pointer2, data in
            let box = unsafeBitCast(data, to: SignalBoxTwo.self)
            box.callback(pointer1, pointer2)
        }

        let handlerId = connectSignal(widgetPointer, name: name, data: Unmanaged.passUnretained(box).toOpaque(), handler: unsafeBitCast(handler, to: GCallback.self))

        signals.append((handlerId, box))
    }

    func addSignal(name: String, callback: @escaping SignalCallbackThree) {
        let box = SignalBoxThree(callback: callback)
        let handler: @convention(c) (UnsafeMutableRawPointer, UnsafeMutableRawPointer, UnsafeMutableRawPointer, UnsafeMutableRawPointer, UnsafeMutableRawPointer) -> Void = { sender, pointer1, pointer2, pointer3, data in
            let box = unsafeBitCast(data, to: SignalBoxThree.self)
            box.callback(pointer1, pointer2, pointer3)
        }

        let handlerId = connectSignal(widgetPointer, name: name, data: Unmanaged.passUnretained(box).toOpaque(), handler: unsafeBitCast(handler, to: GCallback.self))

        signals.append((handlerId, box))
    }

    func addSignal(name: String, callback: @escaping SignalCallbackFour) {
        let box = SignalBoxFour(callback: callback)
        let handler: @convention(c) (UnsafeMutableRawPointer, UnsafeMutableRawPointer, UnsafeMutableRawPointer, UnsafeMutableRawPointer, UnsafeMutableRawPointer, UnsafeMutableRawPointer) -> Void = { sender, pointer1, pointer2, pointer3, pointer4, data in
            let box = unsafeBitCast(data, to: SignalBoxFour.self)
            box.callback(pointer1, pointer2, pointer3, pointer4)
        }

        let handlerId = connectSignal(widgetPointer, name: name, data: Unmanaged.passUnretained(box).toOpaque(), handler: unsafeBitCast(handler, to: GCallback.self))

        signals.append((handlerId, box))
    }

    func addSignal(name: String, callback: @escaping SignalCallbackFive) {
        let box = SignalBoxFive(callback: callback)
        let handler: @convention(c) (UnsafeMutableRawPointer, UnsafeMutableRawPointer, UnsafeMutableRawPointer, UnsafeMutableRawPointer, UnsafeMutableRawPointer, UnsafeMutableRawPointer, UnsafeMutableRawPointer) -> Void = { sender, pointer1, pointer2, pointer3, pointer4, pointer5, data in
            let box = unsafeBitCast(data, to: SignalBoxFive.self)
            box.callback(pointer1, pointer2, pointer3, pointer4, pointer5)
        }

        let handlerId = connectSignal(widgetPointer, name: name, data: Unmanaged.passUnretained(box).toOpaque(), handler: unsafeBitCast(handler, to: GCallback.self))

        signals.append((handlerId, box))
    }

    func addSignal(name: String, callback: @escaping SignalCallbackSix) {
        let box = SignalBoxSix(callback: callback)
        let handler: @convention(c) (UnsafeMutableRawPointer, UnsafeMutableRawPointer, UnsafeMutableRawPointer, UnsafeMutableRawPointer, UnsafeMutableRawPointer, UnsafeMutableRawPointer, UnsafeMutableRawPointer, UnsafeMutableRawPointer) -> Void = { sender, pointer1, pointer2, pointer3, pointer4, pointer5, pointer6, data in
            let box = unsafeBitCast(data, to: SignalBoxSix.self)
            box.callback(pointer1, pointer2, pointer3, pointer4, pointer5, pointer6)
        }

        let handlerId = connectSignal(widgetPointer, name: name, data: Unmanaged.passUnretained(box).toOpaque(), handler: unsafeBitCast(handler, to: GCallback.self))

        signals.append((handlerId, box))
    }

    private func removeSignals() {
        for (handlerId, _) in signals {
            disconnectSignal(widgetPointer, handlerId: handlerId)
        }

        signals = []
    }

}
