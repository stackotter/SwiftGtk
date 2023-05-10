import CGtk

public enum StateType {
    case normal
    case active
    case prelight
    case selected
    case insensitive
    case inconsistent
    case focused

    public init?(rawValue: GtkStateType) {
        switch rawValue {
            case GTK_STATE_NORMAL:
                self = .normal
            case GTK_STATE_ACTIVE:
                self = .active
            case GTK_STATE_PRELIGHT:
                self = .prelight
            case GTK_STATE_SELECTED:
                self = .selected
            case GTK_STATE_INSENSITIVE:
                self = .insensitive
            case GTK_STATE_INCONSISTENT:
                self = .inconsistent
            case GTK_STATE_FOCUSED:
                self = .focused
            default:
                return nil
        }
    }

    public var rawValue: GtkStateType {
        switch self {
            case .normal:
                return GTK_STATE_NORMAL
            case .active:
                return GTK_STATE_ACTIVE
            case .prelight:
                return GTK_STATE_PRELIGHT
            case .selected:
                return GTK_STATE_SELECTED
            case .insensitive:
                return GTK_STATE_INSENSITIVE
            case .inconsistent:
                return GTK_STATE_INCONSISTENT
            case .focused:
                return GTK_STATE_FOCUSED
        }
    }

    public var rawFlagValue: GtkStateFlags {
        switch self {
            case .normal:
                return GTK_STATE_FLAG_NORMAL
            case .active:
                return GTK_STATE_FLAG_ACTIVE
            case .prelight:
                return GTK_STATE_FLAG_PRELIGHT
            case .selected:
                return GTK_STATE_FLAG_SELECTED
            case .insensitive:
                return GTK_STATE_FLAG_INSENSITIVE
            case .inconsistent:
                return GTK_STATE_FLAG_INCONSISTENT
            case .focused:
                return GTK_STATE_FLAG_FOCUSED
        }
    }
}
