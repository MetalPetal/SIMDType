//: Playground - noun: a place where people can play

public struct SIMDType {
    
    public enum ScalarType: CaseIterable {
        case float
        case int
        case uint
        case short
        case ushort
        case char
        case uchar
    }
    
    public enum Dimension {
        case vector(UInt)
        case matrix(UInt, UInt)
    }
    
    public var scalarType: ScalarType
    
    public var dimension: Dimension
    
    public init(scalarType: ScalarType, dimension: Dimension) {
        self.scalarType = scalarType
        self.dimension = dimension
    }
}

extension SIMDType.ScalarType {
    public func description(capitalized: Bool) -> String {
        switch self {
        case .int:
            return capitalized ? "Int": "int"
        case .float:
            return capitalized ? "Float": "float"
        case .uint:
            return capitalized ? "UInt": "uint"
        case .short:
            return capitalized ? "Short": "short"
        case .ushort:
            return capitalized ? "UShort": "ushort"
        case .char:
            return capitalized ? "Char": "char"
        case .uchar:
            return capitalized ? "UChar": "uchar"
        }
    }
    
    public var swiftTypeName: String {
        switch self {
        case .int:
            return "Int32"
        case .float:
            return "Float"
        case .uint:
            return "UInt32"
        case .short:
            return "Int16"
        case .ushort:
            return "UInt16"
        case .char:
            return "Int8"
        case .uchar:
            return "UInt8"
        }
    }
    
    public var cTypeName: String {
        switch self {
        case .int:
            return "int"
        case .float:
            return "float"
        case .uint:
            return "uint"
        case .short:
            return "short"
        case .ushort:
            return "unsigned short"
        case .char:
            return "char"
        case .uchar:
            return "unsigned char"
        }
    }
}

extension SIMDType.Dimension: Equatable {
    public static func == (lhs: SIMDType.Dimension, rhs: SIMDType.Dimension) -> Bool {
        switch lhs {
        case .vector(let leftLength):
            switch rhs {
            case .vector(let rightLength):
                return leftLength == rightLength
            default:
                return false
            }
        case .matrix(let c, let r):
            switch rhs {
            case .matrix(let rC, let rR):
                return c == rC && r == rR
            default:
                return false
            }
        }
    }
}

extension SIMDType: Equatable {
    public static func == (lhs: SIMDType, rhs: SIMDType) -> Bool {
        return lhs.scalarType == rhs.scalarType && lhs.dimension == rhs.dimension
    }
}

extension SIMDType {
    public func description(prefix: String = "simd_") -> String {
        switch self.dimension {
        case .vector(let c):
            return "\(prefix)\(self.scalarType.description(capitalized: false))\(c)"
        case .matrix(let c, let r):
            return "\(prefix)\(self.scalarType.description(capitalized: false))\(c)x\(r)"
        }
    }
}

extension SIMDType {
    
    /// SIMDTypes supported by both Metal and Objective-C.
    public static let metalSupportedSIMDTypes = [
        SIMDType(scalarType: .float, dimension: .vector(2)),
        SIMDType(scalarType: .float, dimension: .vector(3)),
        SIMDType(scalarType: .float, dimension: .vector(4)),
        
        SIMDType(scalarType: .float, dimension: .matrix(2, 2)),
        SIMDType(scalarType: .float, dimension: .matrix(2, 3)),
        SIMDType(scalarType: .float, dimension: .matrix(2, 4)),
        SIMDType(scalarType: .float, dimension: .matrix(3, 2)),
        SIMDType(scalarType: .float, dimension: .matrix(3, 3)),
        SIMDType(scalarType: .float, dimension: .matrix(3, 4)),
        SIMDType(scalarType: .float, dimension: .matrix(4, 2)),
        SIMDType(scalarType: .float, dimension: .matrix(4, 3)),
        SIMDType(scalarType: .float, dimension: .matrix(4, 4)),
        
        SIMDType(scalarType: .int, dimension: .vector(2)),
        SIMDType(scalarType: .int, dimension: .vector(3)),
        SIMDType(scalarType: .int, dimension: .vector(4)),
        
        SIMDType(scalarType: .uint, dimension: .vector(2)),
        SIMDType(scalarType: .uint, dimension: .vector(3)),
        SIMDType(scalarType: .uint, dimension: .vector(4)),
        
        SIMDType(scalarType: .short, dimension: .vector(2)),
        SIMDType(scalarType: .short, dimension: .vector(3)),
        SIMDType(scalarType: .short, dimension: .vector(4)),
        
        SIMDType(scalarType: .ushort, dimension: .vector(2)),
        SIMDType(scalarType: .ushort, dimension: .vector(3)),
        SIMDType(scalarType: .ushort, dimension: .vector(4)),
        
        SIMDType(scalarType: .char, dimension: .vector(2)),
        SIMDType(scalarType: .char, dimension: .vector(3)),
        SIMDType(scalarType: .char, dimension: .vector(4)),
        
        SIMDType(scalarType: .uchar, dimension: .vector(2)),
        SIMDType(scalarType: .uchar, dimension: .vector(3)),
        SIMDType(scalarType: .uchar, dimension: .vector(4)),
    ]
}
