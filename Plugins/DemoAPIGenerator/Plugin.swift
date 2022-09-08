import PackagePlugin
import Foundation

@main
struct Plugin: CommandPlugin {
    func performCommand(context: PluginContext, arguments: [String]) async throws {
        let process = Process()
        process.currentDirectoryURL = context.package.directory.url
        process.executableURL = try context.tool(named: "create-api").path.url
        process.arguments = [
            "generate", "schema.json",
            "--config", "create-api.yml",
            "--output", "DemoAPI",
            "--clean"
        ]

        try process.run()
        process.waitUntilExit()

        if process.terminationStatus != ERR_SUCCESS {
            Diagnostics.error("command terminated with status \(process.terminationStatus)")
        }
    }
}

extension Path {
    var url: URL {
        URL(fileURLWithPath: string)
    }
}
