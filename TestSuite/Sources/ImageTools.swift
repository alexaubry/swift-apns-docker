import CCurl
import Foundation

///
/// The tools to check the integrity of the image.
///

struct ImageTools {

    /// Determines the libcurl version string.
    var cURLVersion: String {

        let versionNum = curl_version_info(CURLVERSION_FOURTH)!.pointee.version_num

        let major = (versionNum & 0b111111110000000000000000) >> 16
        let minor = (versionNum & 0b000000001111111100000000) >> 8
        let patch = (versionNum & 0b000000000000000011111111)

        return [major, minor, patch].map(String.init).joined(separator: ".")

    }

    /// Determines whether libcurl was built with HTTP/2 support.
    var hasHTTP2Support: Bool {

        let version = curl_version_info(CURLVERSION_FOURTH)!.pointee
        let features = version.features

        return (features & CURL_VERSION_HTTP2) == CURL_VERSION_HTTP2

    }

}
