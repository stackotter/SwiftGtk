import CGtk

public class CheckButton: ToggleButton {

    // MARK: Initializers

    /// Creates a new GtkCheckButton.
    public override init() {
        super.init()

        widgetPointer = gtk_check_button_new()
    }

    /// Creates a new GtkCheckButton with a GtkLabel to the right of it.
    public override init(label: String) {
        super.init()

        widgetPointer = gtk_check_button_new_with_label(label)
    }

    /// Creates a new GtkCheckButton containing a label. The label will be created using gtk_label_new_with_mnemonic(), so underscores in label indicate the mnemonic for the check button.
    public override init(mnemonicLabel label: String) {
        super.init()

        widgetPointer = gtk_check_button_new_with_mnemonic(label)
    }
    
}
