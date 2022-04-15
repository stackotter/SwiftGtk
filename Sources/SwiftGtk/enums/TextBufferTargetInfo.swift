import CGtk

/// These values are used as “info” for the targets contained in the lists returned by `gtk_text_buffer_get_copy_target_list()` and `gtk_text_buffer_get_paste_target_list()`.
///
/// The values counts down from -1 to avoid clashes with application added drag destinations which usually start at 0.
/// 
/// https://docs.gtk.org/gtk3/enum.TextBufferTargetInfo.html
public enum TextBufferTargetInfo {
    /// Buffer contents.
    case bufferContents

    /// Rich text.
    case richText

    /// Text.
    case text

    func toGtkTextBufferTargetInfo() -> GtkTextBufferTargetInfo {
        switch self {
        case .bufferContents:
            return GTK_TEXT_BUFFER_TARGET_INFO_BUFFER_CONTENTS
        case .richText:
            return GTK_TEXT_BUFFER_TARGET_INFO_RICH_TEXT
        case .text:
            return GTK_TEXT_BUFFER_TARGET_INFO_TEXT
        }
    }
}

extension GtkTextBufferTargetInfo {
    func toTextBufferTargetInfo() -> TextBufferTargetInfo? {
        switch self {
        case GTK_TEXT_BUFFER_TARGET_INFO_BUFFER_CONTENTS:
            return .bufferContents
        case GTK_TEXT_BUFFER_TARGET_INFO_RICH_TEXT:
            return .richText
        case GTK_TEXT_BUFFER_TARGET_INFO_TEXT:
            return .text
        default:
            return nil
        }
    }
}
