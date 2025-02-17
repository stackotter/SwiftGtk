import CGtk

/// See also: `GtkEntry::delete-from-cursor`.
///
/// [Gtk docs](https://docs.gtk.org/gtk3/enum.DeleteType.html)
public enum DeleteType {
    /// Delete characters.
    case characters
    /// Delete only the portion of the word to the left/right of cursor if we’re in the middle of a word.
    case wordEnds
    /// Delete words.
    case words
    /// Delete display-lines. Display-lines refers to the visible lines, with respect to to the current line breaks. As opposed to paragraphs, which are defined by line breaks in the input.
    case displayLines
    /// Delete only the portion of the display-line to the left/right of cursor.
    case displayLineEnds
    /// Delete to the end of the paragraph. Like C-k in Emacs (or its reverse).
    case paragraphEnds
    /// Delete entire line. Like C-k in pico.
    case paragraphs
    /// Delete only whitespace. Like M-\ in Emacs.
    case whitespace

    func toGtkDeleteType() -> GtkDeleteType {
        switch self {
        case .characters:
            return GTK_DELETE_CHARS
        case .wordEnds:
            return GTK_DELETE_WORD_ENDS
        case .words:
            return GTK_DELETE_WORDS
        case .displayLines:
            return GTK_DELETE_DISPLAY_LINES
        case .displayLineEnds:
            return GTK_DELETE_DISPLAY_LINE_ENDS
        case .paragraphEnds:
            return GTK_DELETE_PARAGRAPH_ENDS
        case .paragraphs:
            return GTK_DELETE_PARAGRAPHS
        case .whitespace:
            return GTK_DELETE_WHITESPACE
        }
    }
}

extension GtkDeleteType {
    func toDeleteType() -> DeleteType {
        switch self {
        case GTK_DELETE_CHARS:
            return .characters
        case GTK_DELETE_WORD_ENDS:
            return .wordEnds
        case GTK_DELETE_WORDS:
            return .words
        case GTK_DELETE_DISPLAY_LINES:
            return .displayLines
        case GTK_DELETE_DISPLAY_LINE_ENDS:
            return .displayLineEnds
        case GTK_DELETE_PARAGRAPH_ENDS:
            return .paragraphEnds
        case GTK_DELETE_PARAGRAPHS:
            return .paragraphs
        case GTK_DELETE_WHITESPACE:
            return .whitespace
        default:
            fatalError("Unsupported GtkDeleteType enum value: \(self.rawValue)")
        }
    }
}
