import Foundation

extension Project {
    /// Options to configure a project.
    public struct Options: Codable, Equatable {
        /// Configures automatic target schemes generation.
        public let automaticSchemesOptions: AutomaticSchemesOptions

        /// Configures the development region.
        public let developmentRegion: String?

        /// Disables generating Bundle accessors.
        public let disableBundleAccessors: Bool

        /// Suppress logging of environment in Run Script build phases.
        public let disableShowEnvironmentVarsInScriptPhases: Bool

        /// Disable synthesized resource accessors.
        public let disableSynthesizedResourceAccessors: Bool

        /// Configures text settings.
        public let textSettings: TextSettings

        /// Configures the name of the generated .xcodeproj.
        public let xcodeProjectName: String?

        public static func options(
            automaticSchemesOptions: AutomaticSchemesOptions = .enabled(),
            developmentRegion: String? = nil,
            disableBundleAccessors: Bool = false,
            disableShowEnvironmentVarsInScriptPhases: Bool = false,
            disableSynthesizedResourceAccessors: Bool = false,
            textSettings: TextSettings = .textSettings(),
            xcodeProjectName: String? = nil
        ) -> Self {
            self.init(
                automaticSchemesOptions: automaticSchemesOptions,
                developmentRegion: developmentRegion,
                disableBundleAccessors: disableBundleAccessors,
                disableShowEnvironmentVarsInScriptPhases: disableShowEnvironmentVarsInScriptPhases,
                disableSynthesizedResourceAccessors: disableSynthesizedResourceAccessors,
                textSettings: textSettings,
                xcodeProjectName: xcodeProjectName
            )
        }
    }
}

// MARK: - AutomaticSchemesOptions

extension Project.Options {
    /// Automatic schemes options allow customizing the generation of the target schemes.
    public enum AutomaticSchemesOptions: Codable, Equatable {
        /// Allows you to define what targets will be enabled for code coverage data gathering.
        public enum TargetSchemesGrouping: Codable, Equatable {
            /// Generate a single scheme for each project.
            case singleScheme

            /// Group schemes according to the suffix of their names.
            case byNameSuffix(build: Set<String>, test: Set<String>, run: Set<String>)

            /// Generate a scheme for each target.
            case notGrouped
        }

        /// Enable autogenerated schemes
        case enabled(
            targetSchemesGrouping: TargetSchemesGrouping = .byNameSuffix(
                build: ["Implementation", "Interface", "Mocks", "Testing"],
                test: ["Tests", "IntegrationTests", "UITests", "SnapshotTests"],
                run: ["App", "Demo"]
            ),
            codeCoverageEnabled: Bool = false,
            testingOptions: TestingOptions = []
        )

        /// Disable autogenerated schemes
        case disabled
    }

    /// The text settings options
    public struct TextSettings: Codable, Equatable {
        /// Whether tabs should be used instead of spaces
        public let usesTabs: Bool?

        /// The width of space indent
        public let indentWidth: UInt?

        /// The width of tab indent
        public let tabWidth: UInt?

        /// Whether lines should be wrapped or not
        public let wrapsLines: Bool?

        public static func textSettings(
            usesTabs: Bool? = nil,
            indentWidth: UInt? = nil,
            tabWidth: UInt? = nil,
            wrapsLines: Bool? = nil
        ) -> Self {
            self.init(usesTabs: usesTabs, indentWidth: indentWidth, tabWidth: tabWidth, wrapsLines: wrapsLines)
        }
    }
}
