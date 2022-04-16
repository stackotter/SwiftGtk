import CGtk

/// Describes a type of line wrapping.
/// 
/// [Gtk docs](https://docs.gtk.org/gtk3/enum.WrapMode.html)
public enum WrapMode {
    /// Do not wrap lines; just make the text area wider.
    case none
    /// Wrap text, breaking lines anywhere the cursor can appear (between characters, usually - if you want to be technical, between graphemes, see pango_get_log_attrs())
    case character
    /// Wrap text, breaking lines in between words.
    case word
    /// Wrap text, breaking lines in between words, or if that is not enough, also between graphemes.
    case wordCharacter

    func toGtkWrapMode() -> GtkWrapMode {
        switch self {
        case .none:
            return GTK_WRAP_NONE
        case .character:
            return GTK_WRAP_CHAR
        case .word:
            return GTK_WRAP_WORD
        case .wordCharacter:
            return GTK_WRAP_WORD_CHAR
        }
    }
}

extension GtkWrapMode {
    func toWrapMode() -> WrapMode {
        switch self {
        case GTK_WRAP_NONE:
            return WrapMode.none
        case GTK_WRAP_CHAR:
            return .character
        case GTK_WRAP_WORD:
            return .word
        case GTK_WRAP_WORD_CHAR:
            return .wordCharacter
        default:
            fatalError("Unsupported GtkWrapMode enum value: \(self.rawValue)")
        }
    }
}
