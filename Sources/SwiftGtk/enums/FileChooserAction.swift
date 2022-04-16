import CGtk

/// Describes whether a `GtkFileChooser` is being used to open existing files or to save to a possibly new file.
/// 
/// [Gtk docs](https://docs.gtk.org/gtk3/enum.FileChooserAction.html)
public enum FileChooserAction {
    /// Indicates open mode. The file chooser will only let the user pick an existing file.
    case `open`
    /// Indicates save mode. The file chooser will let the user pick an existing file, or type in a new filename.
    case save
    /// Indicates an Open mode for selecting folders. The file chooser will let the user pick an existing folder.
    case selectFolder
    /// Indicates a mode for creating a new folder. The file chooser will let the user name an existing or new folder.
    case createFolder

    func toGtkFileChooserAction() -> GtkFileChooserAction {
        switch self {
        case .open:
            return GTK_FILE_CHOOSER_ACTION_OPEN
        case .save:
            return GTK_FILE_CHOOSER_ACTION_SAVE
        case .selectFolder:
            return GTK_FILE_CHOOSER_ACTION_SELECT_FOLDER
        case .createFolder:
            return GTK_FILE_CHOOSER_ACTION_CREATE_FOLDER
        }
    }
}

extension GtkFileChooserAction {
    func toFileChooserAction() -> FileChooserAction {
        switch self {
        case GTK_FILE_CHOOSER_ACTION_OPEN:
            return .open
        case GTK_FILE_CHOOSER_ACTION_SAVE:
            return .save
        case GTK_FILE_CHOOSER_ACTION_SELECT_FOLDER:
            return .selectFolder
        case GTK_FILE_CHOOSER_ACTION_CREATE_FOLDER:
            return .createFolder
        default:
            fatalError("Unexpected enum value")
        }
    }
}
