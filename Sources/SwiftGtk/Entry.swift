import CGtk

/// Essentially just a one-line text input. No clue why Gtk calls it an entry.
public class Entry: Widget {
    public override init() {
        super.init()

        widgetPointer = gtk_entry_new()
    }

    public convenience init(placeholder: String) {
        self.init()

        var placeholder = placeholder
        gtk_entry_set_placeholder_text(castedPointer(), &placeholder)
    }

    override func didMoveToParent() {
        super.didMoveToParent()

        addSignal(name: "changed") { [weak self] in
            guard let self = self else { return }
            self.changed?(self)
        }
    }

    public var text: String {
        get {
            String(cString: gtk_entry_get_text(castedPointer()))
        }
        set {
            var value = newValue
            gtk_entry_set_text(castedPointer(), &value)
        }
    }

    public var changed: ((Entry) -> Void)?
}
