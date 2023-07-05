// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public typealias ID = String

public protocol SelectionSet: ApolloAPI.SelectionSet & ApolloAPI.RootSelectionSet
where Schema == ConcurrencyAPI.SchemaMetadata {}

public protocol InlineFragment: ApolloAPI.SelectionSet & ApolloAPI.InlineFragment
where Schema == ConcurrencyAPI.SchemaMetadata {}

public protocol MutableSelectionSet: ApolloAPI.MutableRootSelectionSet
where Schema == ConcurrencyAPI.SchemaMetadata {}

public protocol MutableInlineFragment: ApolloAPI.MutableSelectionSet & ApolloAPI.InlineFragment
where Schema == ConcurrencyAPI.SchemaMetadata {}

public enum SchemaMetadata: ApolloAPI.SchemaMetadata {
  public static let configuration: ApolloAPI.SchemaConfiguration.Type = SchemaConfiguration.self

  public static func objectType(forTypename typename: String) -> Object? {
    switch typename {
    case "Query": return ConcurrencyAPI.Objects.Query
    case "CourseCollection": return ConcurrencyAPI.Objects.CourseCollection
    case "Course": return ConcurrencyAPI.Objects.Course
    case "Section": return ConcurrencyAPI.Objects.Section
    case "Sys": return ConcurrencyAPI.Objects.Sys
    case "Asset": return ConcurrencyAPI.Objects.Asset
    case "CourseSectionCollection": return ConcurrencyAPI.Objects.CourseSectionCollection
    case "SectionCollection": return ConcurrencyAPI.Objects.SectionCollection
    default: return nil
    }
  }
}

public enum Objects {}
public enum Interfaces {}
public enum Unions {}
