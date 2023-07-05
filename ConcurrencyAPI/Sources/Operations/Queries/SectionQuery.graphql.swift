// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class SectionQuery: GraphQLQuery {
  public static let operationName: String = "Section"
  public static let document: ApolloAPI.DocumentType = .notPersisted(
    definition: .init(
      #"""
      query Section {
        sectionCollection {
          __typename
          sections: items {
            __typename
            sys {
              __typename
              id
            }
            title
          }
        }
      }
      """#
    ))

  public init() {}

  public struct Data: ConcurrencyAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { ConcurrencyAPI.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("sectionCollection", SectionCollection?.self),
    ] }

    public var sectionCollection: SectionCollection? { __data["sectionCollection"] }

    /// SectionCollection
    ///
    /// Parent Type: `SectionCollection`
    public struct SectionCollection: ConcurrencyAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { ConcurrencyAPI.Objects.SectionCollection }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("items", alias: "sections", [Section?].self),
      ] }

      public var sections: [Section?] { __data["sections"] }

      /// SectionCollection.Section
      ///
      /// Parent Type: `Section`
      public struct Section: ConcurrencyAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { ConcurrencyAPI.Objects.Section }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("sys", Sys.self),
          .field("title", String?.self),
        ] }

        public var sys: Sys { __data["sys"] }
        public var title: String? { __data["title"] }

        /// SectionCollection.Section.Sys
        ///
        /// Parent Type: `Sys`
        public struct Sys: ConcurrencyAPI.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: ApolloAPI.ParentType { ConcurrencyAPI.Objects.Sys }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("id", String.self),
          ] }

          public var id: String { __data["id"] }
        }
      }
    }
  }
}
