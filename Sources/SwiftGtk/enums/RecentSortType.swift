import CGtk

/// Used to specify the sorting method to be applyed to the recently used resource list.
/// 
/// [Gtk docs](https://docs.gtk.org/gtk3/enum.RecentSortType.html)
public enum RecentSortType {
    /// Do not sort the returned list of recently used resources.
    case none
    /// Sort the returned list with the most recently used items first.
    case mostRecentlyUsed
    /// Sort the returned list with the least recently used items first.
    case leastRecentlyUsed
    /// Sort the returned list using a custom sorting function passed using `gtk_recent_chooser_set_sort_func()`.
    case custom

    func toGtkRecentSortType() -> GtkRecentSortType {
        switch self {
        case .none:
            return GTK_RECENT_SORT_NONE
        case .mostRecentlyUsed:
            return GTK_RECENT_SORT_MRU
        case .leastRecentlyUsed:
            return GTK_RECENT_SORT_LRU
        case .custom:
            return GTK_RECENT_SORT_CUSTOM
        }
    }
}

extension GtkRecentSortType {
    func toRecentSortType() -> RecentSortType {
        switch self {
        case GTK_RECENT_SORT_NONE:
            return RecentSortType.none
        case GTK_RECENT_SORT_MRU:
            return .mostRecentlyUsed
        case GTK_RECENT_SORT_LRU:
            return .leastRecentlyUsed
        case GTK_RECENT_SORT_CUSTOM:
            return .custom
        default:
            fatalError("Unexpected enum value")
        }
    }
}
