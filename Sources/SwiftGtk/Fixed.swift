import CGtk

/// The GtkFixed widget is a container which can place child widgets at fixed positions and with fixed sizes, given in pixels. GtkFixed performs no automatic layout management.
/// 
/// [GTK docs](https://docs.gtk.org/gtk3/class.Fixed.html)
public class Fixed: Container {

    /// Creates a new GtkFixed.
    public override init() {
        super.init()

        widgetPointer = gtk_fixed_new()
    }

    /// Moves a child of a GtkFixed container to the given position.
    public func move(child: Widget, x: Int, y: Int) {
        gtk_fixed_move(castedPointer(), child.widgetPointer, gint(x), gint(y))
    }

    /// Adds a widget to a GtkFixed container at the given position.
    public func put(child: Widget, x: Int, y: Int) {
        widgets.append(child)
        child.parentWidget = self

        gtk_fixed_put(castedPointer(), child.widgetPointer, gint(x), gint(y))
    }
}
