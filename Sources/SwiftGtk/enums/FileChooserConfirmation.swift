import CGtk

/// Used as a return value of handlers for the `GtkFileChooser::confirm-overwrite` signal of a `GtkFileChooser`. This value determines whether the file chooser will present the stock confirmation dialog, accept the user’s choice of a filename, or let the user choose another filename.
/// 
/// https://docs.gtk.org/gtk3/enum.FileChooserConfirmation.html
public enum FileChooserConfirmation {
    /// The file chooser will present its stock dialog to confirm about overwriting an existing file.
    case confirm

    /// The file chooser will terminate and accept the user’s choice of a file name.
    case acceptFileName

    /// The file chooser will continue running, so as to let the user select another file name.
    case selectAgain

    func toGtkFileChooserConfirmation() -> GtkFileChooserConfirmation {
        switch self {
        case .confirm:
            return GTK_FILE_CHOOSER_CONFIRMATION_CONFIRM
        case .acceptFileName:
            return GTK_FILE_CHOOSER_CONFIRMATION_ACCEPT_FILENAME
        case .selectAgain:
            return GTK_FILE_CHOOSER_CONFIRMATION_SELECT_AGAIN
        }
    }
}

extension GtkFileChooserConfirmation {
    func toFileChooserConfirmation() -> FileChooserConfirmation? {
        switch self {
        case GTK_FILE_CHOOSER_CONFIRMATION_CONFIRM:
            return .confirm
        case GTK_FILE_CHOOSER_CONFIRMATION_ACCEPT_FILENAME:
            return .acceptFileName
        case GTK_FILE_CHOOSER_CONFIRMATION_SELECT_AGAIN:
            return .selectAgain
        default:
            return nil
        }
    }
}
