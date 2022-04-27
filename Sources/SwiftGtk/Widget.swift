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

    // MARK: Public Properties

    public var appPaintable: Bool {
        get { gtk_widget_get_app_paintable(widgetPointer).toBool() }
        set { gtk_widget_set_app_paintable(widgetPointer, newValue.toGBoolean()) }
    }

    public var canDefault: Bool {
        get { gtk_widget_get_can_default(widgetPointer).toBool() }
        set { gtk_widget_set_can_default(widgetPointer, newValue.toGBoolean()) }
    }

    public var canFocus: Bool {
        get { gtk_widget_get_can_focus(widgetPointer).toBool() }
        set { gtk_widget_set_can_focus(widgetPointer, newValue.toGBoolean()) }
    }

    public var compositeChild: Bool {
        get { getProperty(castedPointer(), name: "composite-child") }
        set { setProperty(castedPointer(), name: "composite-child", newValue: newValue) }
    }

    // public var events: EventMask {
    //     get { gtk_widget_get_events(widgetPointer).toEventMask() }
    //     set { gtk_widget_set_events(widgetPointer, newValue.toGdkEventMask()) }
    // }

    /// Whether to expand in both directions. Setting this sets both `GtkWidget:hexpand`` and `GtkWidget:vexpand``.
    public var expand: Bool {
        get { getProperty(castedPointer(), name: "expand") }
        set { setProperty(castedPointer(), name: "expand", newValue: newValue) }
    }

    /// Whether the widget should grab focus when it is clicked with the mouse.
    public var focusOnClick: Bool {
        get { gtk_widget_get_focus_on_click(widgetPointer).toBool() }
        set { gtk_widget_set_focus_on_click(widgetPointer, newValue.toGBoolean()) }
    }

    /// How to distribute horizontal space if widget gets extra space, see GtkAlign.
    public var hAlign: Align {
        get { gtk_widget_get_halign(widgetPointer).toAlign() }
        set { gtk_widget_set_halign(widgetPointer, newValue.toGtkAlign()) }
    }

    public var hasDefault: Bool {
        get { getProperty(castedPointer(), name: "has-default") }
        set { setProperty(castedPointer(), name: "has-default", newValue: newValue) }
    }

    public var hasFocus: Bool {
        get { getProperty(castedPointer(), name: "has-focus") }
        set { setProperty(castedPointer(), name: "has-focus", newValue: newValue) }
    }

    /// Enables or disables the emission of GtkWidget::query-tooltip on widget. A value of TRUE indicates that widget can have a tooltip, in this case the widget will be queried using GtkWidget::query-tooltip to determine whether it will provide a tooltip or not.
    public var hasToolTip: Bool {
        get { gtk_widget_get_has_tooltip(widgetPointer).toBool() }
        set { gtk_widget_set_has_tooltip(widgetPointer, newValue.toGBoolean()) }
    }

    public var heightRequest: Int {
        get { getProperty(castedPointer(), name: "height-request") }
        set { setProperty(castedPointer(), name: "height-request", newValue: newValue) }
    }

    /// Whether to expand horizontally. See gtk_widget_set_hexpand().
    public var hExpand: Bool {
        get { gtk_widget_get_hexpand(widgetPointer).toBool() }
        set { gtk_widget_set_hexpand(widgetPointer, newValue.toGBoolean()) }
    }

    /// Whether to use the GtkWidget:hexpand property. See gtk_widget_get_hexpand_set().
    public var hExpandSet: Bool {
        get { gtk_widget_get_hexpand_set(widgetPointer).toBool() }
        set { gtk_widget_set_hexpand_set(widgetPointer, newValue.toGBoolean()) }
    }

    public var isFocus: Bool {
        get { getProperty(castedPointer(), name: "is-focus") }
        set { setProperty(castedPointer(), name: "is-focus", newValue: newValue) }
    }

    /// Sets all four sides’ margin at once. If read, returns max margin on any side.
    public var margin: Int {
        get { getProperty(castedPointer(), name: "margin") }
        set { setProperty(castedPointer(), name: "margin", newValue: newValue) }
    }

    /// Margin on bottom side of widget.
    public var marginBottom: Int {
        get { Int(gtk_widget_get_margin_bottom(widgetPointer)) }
        set { gtk_widget_set_margin_bottom(widgetPointer, gint(newValue)) }
    }

    /// Margin on end of widget, horizontally. This property supports left-to-right and right-to-left text directions.
    public var marginEnd: Int {
        get { Int(gtk_widget_get_margin_end(widgetPointer)) }
        set { gtk_widget_set_margin_end(widgetPointer, gint(newValue)) }
    }

    /// Margin on start of widget, horizontally. This property supports left-to-right and right-to-left text directions.
    public var marginStart: Int {
        get { Int(gtk_widget_get_margin_start(widgetPointer)) }
        set { gtk_widget_set_margin_start(widgetPointer, gint(newValue)) }
    }

    /// Margin on top side of widget.
    public var marginTop: Int {
        get { Int(gtk_widget_get_margin_top(widgetPointer)) }
        set { gtk_widget_set_margin_top(widgetPointer, gint(newValue)) }
    }

    public var name: String {
        get { String(cString: gtk_widget_get_name(widgetPointer)) }
        set { gtk_widget_set_name(widgetPointer, newValue) }
    }

    public var noShowAll: Bool {
        get { gtk_widget_get_no_show_all(widgetPointer).toBool() }
        set { gtk_widget_set_no_show_all(widgetPointer, newValue.toGBoolean()) }
    }

    /// The requested opacity of the widget. See gtk_widget_set_opacity() for more details about window opacity.
    public var opacity: Double {
        get { gtk_widget_get_opacity(widgetPointer) }
        set { gtk_widget_set_opacity(widgetPointer, newValue) }
    }

    // public var parent: Container {
    //     get { gtk_widget_get_parent(widgetPointer) }
    //     set { gtk_widget_set_parent(widgetPointer, newValue) }
    // }

    public var recievesDefault: Bool {
        get { gtk_widget_get_receives_default(widgetPointer).toBool() }
        set { gtk_widget_set_receives_default(widgetPointer, newValue.toGBoolean()) }
    }

    /// The scale factor of the widget. See gtk_widget_get_scale_factor() for more details about widget scaling.
    public var scaleFactor: Int { Int(gtk_widget_get_scale_factor(widgetPointer)) }

    public var sensitive: Bool {
        get { gtk_widget_get_sensitive(widgetPointer).toBool() }
        set { gtk_widget_set_sensitive(widgetPointer, newValue.toGBoolean()) }
    }

    /// Sets the text of tooltip to be the given string, which is marked up with the [Pango text markup language][PangoMarkupFormat]. Also see gtk_tooltip_set_markup().
    public var tooltipMarkup: String {
        get { String(cString: gtk_widget_get_tooltip_markup(widgetPointer)) }
        set { gtk_widget_set_tooltip_markup(widgetPointer, newValue) }
    }

    /// Sets the text of tooltip to be the given string.
    public var tooltipText: String {
        get { String(cString: gtk_widget_get_tooltip_text(widgetPointer)) }
        set { gtk_widget_set_tooltip_text(widgetPointer, newValue) }
    }

    /// How to distribute vertical space if widget gets extra space, see GtkAlign.
    public var vAlign: Align {
        get { gtk_widget_get_valign(widgetPointer).toAlign() }
        set { gtk_widget_set_valign(widgetPointer, newValue.toGtkAlign()) }
    }

    /// Whether to expand vertically. See gtk_widget_set_vexpand().
    public var vExpand: Bool {
        get { gtk_widget_get_vexpand(widgetPointer).toBool() }
        set { gtk_widget_set_vexpand(widgetPointer, newValue.toGBoolean()) }
    }

    /// Whether to use the GtkWidget:vexpand property. See gtk_widget_get_vexpand_set().
    public var vExpandSet: Bool {
        get { gtk_widget_get_vexpand_set(widgetPointer).toBool() }
        set { gtk_widget_set_vexpand_set(widgetPointer, newValue.toGBoolean()) }
    }

    public var visible: Bool {
        get { gtk_widget_get_visible(widgetPointer).toBool() }
        set { gtk_widget_set_visible(widgetPointer, newValue.toGBoolean()) }
    }

    public var widthRequest: Int {
        get { getProperty(castedPointer(), name: "width-request") }
        set { setProperty(castedPointer(), name: "width-request", newValue: newValue) }
    }

    // /// The widget’s window if it is realized, NULL otherwise.
    // public var window: Window? { gtk_widget_get_window(widgetPointer) }

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
