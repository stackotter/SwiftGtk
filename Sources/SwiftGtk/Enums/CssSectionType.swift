import CGtk

/// The different types of sections indicate parts of a CSS document as parsed by GTK’s CSS parser. They are oriented towards the [CSS Grammar](http://www.w3.org/TR/CSS21/grammar.html), but may contain extensions.
///
/// More types might be added in the future as the parser incorporates more features.
/// 
/// Available since:	3.2
///
/// [Gtk docs](https://docs.gtk.org/gtk3/enum.CssSectionType.html)
public enum CssSectionType {
    /// The section describes a complete document. This section time is the only one where `gtk_css_section_get_parent()` might return `NULL`.
    case document
    /// The section defines an import rule.
    case `import`
    /// The section defines a color. This is a GTK extension to CSS.
    case colorDefinition
    /// The section defines a binding set. This is a GTK extension to CSS.
    case bindingSet
    /// The section defines a CSS ruleset.
    case ruleSet
    /// The section defines a CSS selector.
    case selector
    /// The section defines the declaration of a CSS variable.
    case declaration
    /// The section defines the value of a CSS declaration.
    case value
    /// The section defines keyframes. See [CSS Animations](http://dev.w3.org/csswg/css3-animations/#keyframes) for details. Since 3.6
    case keyFrames

    func toGtkCssSectionType() -> GtkCssSectionType {
        switch self {
        case .document:
            return GTK_CSS_SECTION_DOCUMENT
        case .import:
            return GTK_CSS_SECTION_IMPORT
        case .colorDefinition:
            return GTK_CSS_SECTION_COLOR_DEFINITION
        case .bindingSet:
            return GTK_CSS_SECTION_BINDING_SET
        case .ruleSet:
            return GTK_CSS_SECTION_RULESET
        case .selector:
            return GTK_CSS_SECTION_SELECTOR
        case .declaration:
            return GTK_CSS_SECTION_DECLARATION
        case .value:
            return GTK_CSS_SECTION_VALUE
        case .keyFrames:
            return GTK_CSS_SECTION_KEYFRAMES
        }
    }
}

extension GtkCssSectionType {
    func toCssSectionType() -> CssSectionType {
        switch self {
        case GTK_CSS_SECTION_DOCUMENT:
            return .document
        case GTK_CSS_SECTION_IMPORT:
            return .import
        case GTK_CSS_SECTION_COLOR_DEFINITION:
            return .colorDefinition
        case GTK_CSS_SECTION_BINDING_SET:
            return .bindingSet
        case GTK_CSS_SECTION_RULESET:
            return .ruleSet
        case GTK_CSS_SECTION_SELECTOR:
            return .selector
        case GTK_CSS_SECTION_DECLARATION:
            return .declaration
        case GTK_CSS_SECTION_VALUE:
            return .value
        case GTK_CSS_SECTION_KEYFRAMES:
            return .keyFrames
        default:
            fatalError("Unsupported GtkCssSectionType enum value: \(self.rawValue)")
        }
    }
}
