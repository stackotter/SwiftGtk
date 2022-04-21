//
//  Copyright © 2015 Tomas Linhart. All rights reserved.
//

import CGtk

open class Button: Bin {

    // MARK: Initializers

    /// Creates a new GtkButton widget. To add a child widget to the button, use gtk_container_add().
    public override init() {
        super.init()
        widgetPointer = gtk_button_new()
    }

    /// Creates a new button containing an icon from the current icon theme.
    public init(iconName: String, iconSize: IconSize) {
        super.init()
        widgetPointer = gtk_button_new_from_icon_name(iconName, iconSize.toGtkIconSize())
    }

    /// Creates a GtkButton widget with a GtkLabel child containing the given text.
    public init(label: String) {
        super.init()
        widgetPointer = gtk_button_new_with_label(label)
    }

    /// Creates a new GtkButton containing a label. If characters in label are preceded by an underscore, they are underlined. If you need a literal underscore character in a label, use “__” (two underscores). The first underlined character represents a keyboard accelerator called a mnemonic. Pressing Alt and that key activates the button.
    public init(mnemonicLabel label: String) {
        super.init()
        widgetPointer = gtk_button_new_with_mnemonic(label)
    }

    // MARK: Widget Overrides

    override func didMoveToParent() {
        super.didMoveToParent()

        addSignal(name: "clicked") { [weak self] in
            guard let self = self else { return }
            self.clicked?(self)
        }
    }

    // MARK: Properties

    /// If TRUE, the button will ignore the GtkSettings:gtk-button-images setting and always show the image, if available.
    public var alwaysShowImage: Bool {
        get { gtk_button_get_always_show_image(castedPointer()).toBool() }
        set { gtk_button_set_always_show_image(castedPointer(), newValue.toGBoolean()) }
    }

    /// The position of the image relative to the text inside the button.
    public var imagePosition: PositionType {
        get { gtk_button_get_image_position(castedPointer()).toPositionType() }
        set { gtk_button_set_image_position(castedPointer(), newValue.toGtkPositionType()) }
    }

    public var label: String? {
        get { String(cString: gtk_button_get_label(castedPointer())) }
        set { gtk_button_set_label(castedPointer(), newValue) }
    }

    public var relief: ReliefStyle {
        get { gtk_button_get_relief(castedPointer()).toReliefStyle() }
        set { gtk_button_set_relief(castedPointer(), newValue.toGtkReliefStyle()) }
    }

    public var useUnderline: Bool {
        get { gtk_button_get_use_underline(castedPointer()).toBool() }
        set { gtk_button_set_use_underline(castedPointer(), newValue.toGBoolean()) }
    }

    // MARK: Signals

    public var clicked: ((Button) -> Void)?

}
