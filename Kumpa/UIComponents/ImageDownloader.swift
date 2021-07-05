
import Foundation
import UIKit



extension UIImageView: Cancelable {
    func cancel(imageURL: URL) {
        runningRequests[imageURL]?.cancel()
    }
    
    
    func loadImage(imageURL: URL, placeHolderImage: String){
        self.image = UIImage(named: placeHolderImage)
        
        if let cachedImage = imageCache.object(forKey: imageURL as AnyObject) {
            self.image = cachedImage
            return
        }
        
        // if not, download image from url
        let task = URLSession.shared.dataTask(with: imageURL, completionHandler: { (data, response, error) in
                if error != nil {
                    print(error!)
                    return
                }

                DispatchQueue.main.async {
                    if let image = UIImage(data: data!) {
                        imageCache.setObject(image, forKey: imageURL as AnyObject)
                        self.image = image
                    }
                }

            })
        runningRequests[imageURL] = task
        task.resume()
        
        
    }
    
    
    func ResizeImage(image: UIImage, targetSize: CGSize) -> UIImage {

        let rect = CGRect(x: 0, y: 0, width: targetSize.width, height: targetSize.height)

        UIGraphicsBeginImageContextWithOptions(targetSize, false, 1.0)
        image.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return newImage ?? UIImage(named: "placeholder")!
    }
}
