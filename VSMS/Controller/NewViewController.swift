
import UIKit
import MapKit

struct PostImageModel {
    let image:  UIImage
}

class NewViewController: UIViewController {
    
    
    @IBOutlet weak var map: MKMapView!
    
    
    @IBOutlet private weak var collectionView: UICollectionView?
    
    var postImages: Array<PostImageModel> = []
    
    let picker = UIImagePickerController()
    
    var tempImage: UIImage?
    
    var currentIndex: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let span:MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        
        let locations: CLLocationCoordinate2D = CLLocationCoordinate2DMake(11.568706,104.870350 )
        let region: MKCoordinateRegion = MKCoordinateRegion(center: locations, span: span)
        map.setRegion(region, animated: true)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = locations
        annotation.title = "121 Company"
        annotation.subtitle = "Heard Office"
        map.addAnnotation(annotation)
        
        setupView()
        
       for _ in 0...7 {
           self.postImages.append(PostImageModel(image: UIImage(named: "icons8-plus-math-50 (5)")!))
    }
        
    }
    
    fileprivate func setupView() {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 60, height: 60)
        layout.scrollDirection = .horizontal			
        collectionView?.collectionViewLayout = layout
        
        collectionView?.dataSource = self
        collectionView?.delegate = self
        collectionView?.clipsToBounds = true
        collectionView?.showsHorizontalScrollIndicator = false
        
        let cellNib = UINib(nibName: "PhotoListCollectionViewCell", bundle: nil)
        collectionView?.register(cellNib, forCellWithReuseIdentifier: "photoCell")
        
        picker.delegate = self
    }
    
    @IBAction func backbtnpress(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}

extension NewViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return postImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoCell",
                                                      for: indexPath) as? PhotoListCollectionViewCell
        cell!.postImageView?.image = postImages[indexPath.row].image
        return cell!
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
        
        self.currentIndex = indexPath.row
        
        let alertController = UIAlertController(title: "", message: "", preferredStyle: .actionSheet)
        let cameraAction = UIAlertAction(title: "Open Camera", style: .default) { (alert) in
            self.picker.sourceType = .camera
            self.present(self.picker, animated: true, completion: nil)
        }
        
        let photoAlbumAction = UIAlertAction(title: "Album", style: .default) { (alert) in
            self.picker.sourceType = .photoLibrary
            self.present(self.picker, animated: true, completion: nil)
        }
        
        alertController.addAction(cameraAction)
        alertController.addAction(photoAlbumAction)
        
        _ = UIStoryboard.init(name: "Main", bundle: nil)
        //= storyBoard.instantiateViewController(withIdentifier: "testVC") as? TestViewController
        //let navigationController = UINavigationController(rootViewController: VC!)
        //present(VC!    , animated: true, completion: nil)
        
        
        present(alertController, animated: true, completion: nil)
    }
    
}

extension NewViewController: UIImagePickerControllerDelegate , UINavigationControllerDelegate {
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let selectedImage: UIImage = info[.originalImage] as? UIImage {
            
            picker.dismiss(animated: true) {
                self.tempImage = selectedImage
                self.postImages[self.currentIndex] = PostImageModel(image: selectedImage)
                self.collectionView?.reloadData()
            }
            
        }
       
        
    }
}
