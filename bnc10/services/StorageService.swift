import FirebaseStorage

class StorageService {
    static func uploadImage(uid: String, nameImg: String, image: UIImage) {
        let storage = Storage.storage()
        let storageRef = storage.reference()
        var data = NSData()
        data = UIImageJPEGRepresentation(image, 0.8)! as NSData
        // set upload path
        let filePath = "\(uid)/\(nameImg)"
        let metaData = StorageMetadata()
        metaData.contentType = "image/jpg"
        storageRef.child(filePath).putData(data as Data, metadata: metaData) { (metaData,error) in
            guard metaData != nil else {
                print("Ops error uploadImage")
                return
            }
            
            //print(metaData?.path)
            // Metadata contains file metadata such as size, content-type.
            // let size = metadata.size
            // You can also access to download URL after upload.
            storageRef.downloadURL { (url, error) in
                guard url != nil else {
                    print("Ops error uploadImage downloadURL")
                    return
                }
                print(url ?? "---empty downloadURL---")
            }
            
        }
        
        
        
    }
}
