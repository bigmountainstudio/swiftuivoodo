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
    @Published var data: [DataObject] = []
    
    func fetch() {
        data = [DataObject(name: "Datum 1"),
                DataObject(name: "Datum 2"),
                DataObject(name: "Datum 3")]
    }
}

// Data Object
import Foundation

struct DataObject: Identifiable {
    let id = UUID()
    var name: String
}
