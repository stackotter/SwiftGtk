import Foundation
import CGtk

/// A wrapper for Gtk's native file chooser.
public struct FileChooser {
    /// Presents a file chooser dialog in the given window, and gets the chosen files (if any).
    public static func present(_ window: Window) -> URL? {
        let native = gtk_file_chooser_native_new("Open file", window.castedPointer(), GTK_FILE_CHOOSER_ACTION_OPEN, "_Open", "_Cancel")
        let result = gtk_native_dialog_run(UnsafeMutablePointer<GtkNativeDialog>(native))
        if GtkResponseType(rawValue: result) == GTK_RESPONSE_ACCEPT {
            guard let filename = gtk_file_chooser_get_filename(native) else {
                return nil
            }
            return URL(fileURLWithPath: String(cString: filename))
        } else {
            return nil
        }
    }
}
