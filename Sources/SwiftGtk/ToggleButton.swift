//
//  Copyright © 2017 Tomas Linhart. All rights reserved.
//

import CGtk

public class ToggleButton: Button {

    // MARK: Initializers

    /// Creates a new toggle button. A widget should be packed into the button, as in gtk_button_new().
    public override init() {
        super.init()

        widgetPointer = gtk_toggle_button_new()
    }

    /// Creates a new toggle button with a text label.
    public override init(label: String) {
        super.init()

        widgetPointer = gtk_toggle_button_new_with_label(label)
    }

    /// Creates a new GtkToggleButton containing a label. The label will be created using gtk_label_new_with_mnemonic(), so underscores in label indicate the mnemonic for the button.
    public override init(mnemonicLabel label: String) {
        super.init()

        widgetPointer = gtk_toggle_button_new_with_mnemonic(label)
    }

    // MARK: Widget Overrides

    override func didMoveToParent() {
        super.didMoveToParent()

        addSignal(name: "toggled") { [weak self] in
            guard let self = self else { return }
            self.toggled?(self)
        }
    }

    // MARK: Properties

    public var mode: Bool {
        get { gtk_toggle_button_get_mode(castedPointer()).toBool() }
        set { gtk_toggle_button_set_mode(castedPointer(), newValue.toGBoolean()) }
    }

    public var active: Bool {
        get { gtk_toggle_button_get_active(castedPointer()).toBool() }
        set { gtk_toggle_button_set_active(castedPointer(), newValue.toGBoolean()) }
    }

    public var inconsistent: Bool {
        get { gtk_toggle_button_get_inconsistent(castedPointer()).toBool() }
        set { gtk_toggle_button_set_inconsistent(castedPointer(), newValue.toGBoolean()) }
    }

    // MARK: Signals

    public var toggled: ((ToggleButton) -> Void)?
}
