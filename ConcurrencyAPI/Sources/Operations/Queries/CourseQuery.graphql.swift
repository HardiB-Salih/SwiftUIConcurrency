// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class CourseQuery: GraphQLQuery {
  public static let operationName: String = "Course"
  public static let document: ApolloAPI.DocumentType = .notPersisted(
    definition: .init(
      #"""
      query Course {
        courseCollection {
          __typename
          courses: items {
            __typename
            sys {
              __typename
              publishedAt
              id
            }
            title
            subtitle
            numberOfSections
            numberOfHours
            subject
            colors
            illustration {
              __typename
              url
            }
            sectionCollection {
              __typename
              sections: items {
                __typename
                sys {
                  __typename
                  id
                }
                title
                subtitle
                content
              }
            }
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
      .field("courseCollection", CourseCollection?.self),
    ] }

    public var courseCollection: CourseCollection? { __data["courseCollection"] }

    /// CourseCollection
    ///
    /// Parent Type: `CourseCollection`
    public struct CourseCollection: ConcurrencyAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { ConcurrencyAPI.Objects.CourseCollection }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("items", alias: "courses", [Course?].self),
      ] }

      public var courses: [Course?] { __data["courses"] }

      /// CourseCollection.Course
      ///
      /// Parent Type: `Course`
      public struct Course: ConcurrencyAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { ConcurrencyAPI.Objects.Course }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("sys", Sys.self),
          .field("title", String?.self),
          .field("subtitle", String?.self),
          .field("numberOfSections", Int?.self),
          .field("numberOfHours", Int?.self),
          .field("subject", String?.self),
          .field("colors", [String?]?.self),
          .field("illustration", Illustration?.self),
          .field("sectionCollection", SectionCollection?.self),
        ] }

        public var sys: Sys { __data["sys"] }
        public var title: String? { __data["title"] }
        public var subtitle: String? { __data["subtitle"] }
        public var numberOfSections: Int? { __data["numberOfSections"] }
        public var numberOfHours: Int? { __data["numberOfHours"] }
        public var subject: String? { __data["subject"] }
        public var colors: [String?]? { __data["colors"] }
        public var illustration: Illustration? { __data["illustration"] }
        public var sectionCollection: SectionCollection? { __data["sectionCollection"] }

        /// CourseCollection.Course.Sys
        ///
        /// Parent Type: `Sys`
        public struct Sys: ConcurrencyAPI.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: ApolloAPI.ParentType { ConcurrencyAPI.Objects.Sys }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("publishedAt", ConcurrencyAPI.DateTime?.self),
            .field("id", String.self),
          ] }

          public var publishedAt: ConcurrencyAPI.DateTime? { __data["publishedAt"] }
          public var id: String { __data["id"] }
        }

        /// CourseCollection.Course.Illustration
        ///
        /// Parent Type: `Asset`
        public struct Illustration: ConcurrencyAPI.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: ApolloAPI.ParentType { ConcurrencyAPI.Objects.Asset }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("url", String?.self),
          ] }

          public var url: String? { __data["url"] }
        }

        /// CourseCollection.Course.SectionCollection
        ///
        /// Parent Type: `CourseSectionCollection`
        public struct SectionCollection: ConcurrencyAPI.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: ApolloAPI.ParentType { ConcurrencyAPI.Objects.CourseSectionCollection }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("items", alias: "sections", [Section?].self),
          ] }

          public var sections: [Section?] { __data["sections"] }

          /// CourseCollection.Course.SectionCollection.Section
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
              .field("subtitle", String?.self),
              .field("content", String?.self),
            ] }

            public var sys: Sys { __data["sys"] }
            public var title: String? { __data["title"] }
            public var subtitle: String? { __data["subtitle"] }
            public var content: String? { __data["content"] }

            /// CourseCollection.Course.SectionCollection.Section.Sys
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
  }
}
