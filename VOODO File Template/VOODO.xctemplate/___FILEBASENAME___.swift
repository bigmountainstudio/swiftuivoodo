//___FILEHEADER___

// View
import SwiftUI

struct ___FILEBASENAMEASIDENTIFIER___View: View {
    @StateObject private var oo = ___FILEBASENAMEASIDENTIFIER___OO()
    
    var body: some View {
        VStack {
            List(oo.data) { datum in
                Text(datum.name)
            }
        }
        .onAppear {
            oo.fetch()
        }
    }
}

struct ___FILEBASENAMEASIDENTIFIER____Previews: PreviewProvider {
    static var previews: some View {
        ___FILEBASENAMEASIDENTIFIER___View()
    }
}
// Observable Object
import Combine
import SwiftUI

class ___FILEBASENAMEASIDENTIFIER___OO: ObservableObject {
    @Published var data: [___FILEBASENAMEASIDENTIFIER___DO] = []
    
    func fetch() {
        data = [___FILEBASENAMEASIDENTIFIER___DO(name: "Datum 1"),
                ___FILEBASENAMEASIDENTIFIER___DO(name: "Datum 2"),
                ___FILEBASENAMEASIDENTIFIER___DO(name: "Datum 3")]
    }
}

// Data Object
import Foundation

struct ___FILEBASENAMEASIDENTIFIER___DO: Identifiable {
    let id = UUID()
    var name: String
}
