import SwiftUI
import Foundation

struct CircularShape: Shape {
    
    // Her yerde kullanabilmek için burada tanımladık ve bunların içinde saklayacağız
    var percent : Double
    var startAngle : Double
    
    // Animasyon edilebilir olması için 9 satırlık bu kodu eklemeliyiz
    typealias AnimatableData = Double
    var animatableData: Double {
        get {
            return percent // Neye göre animasyon edileceğini gösterilmesi
        }
        set {
            percent = newValue
        }
    }
    
    init(percent : Double = 100, startAngle : Double = -90) {
        
        self.percent = percent
        self.startAngle = startAngle
        
    }
    
    // Çizeceğimiz şeklin yolunu belirtiyor.
    func path(in rect: CGRect) -> Path {
        
        let width = rect.width
        let height = rect.height
        let radius = min(width, height) / 2 // Kusursuz bir daire olmazsa diye önlem
        let center = CGPoint(x: width / 2, y: height / 2)
        let endAngle = (self.percent / 100 * 360) + self.startAngle // Yüzde kaçı dolacaksa o kadar sonraki dereceyi hesaplamak için
        
        return Path { path in
            path.addArc(center: center, radius: radius, startAngle: Angle(degrees: startAngle), endAngle: Angle(degrees: endAngle), clockwise: false)
        }
    }
    
}
