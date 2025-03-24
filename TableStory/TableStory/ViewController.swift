//
//  ViewController.swift
//  TableStory
//
//  Created by Perkinson, Kendall on 3/17/25.
//

import UIKit
import MapKit

let data = [
    Item(name: "Back The Bobcats Block Party", location: "Zelicks, San Marcos", date: "8/30/24", desc: "The second annual Back The Bobcats Block Party at Zelicks to celebrate back to school season. Included live music, food & spirit rally with the TXST Strutters & Football team as well as special appearances from the college president & mascot. This event was so special to work for as it combined my love for my school in San Marcos & love for Topo Chico!", lat: 30.273320, long: -97.753550, imageName: "event1"),
    
    Item(name: "Vibe Artisan Market", location: "Distribution Hall, Austin", date:"7/24/24" , desc: "A 2-day market at the Austin Distribution Hall showcasing 100+ exhibitors & creatives. Complimentary Sabores flavors were handed out to guests as they experienced the art gallery installations, music creators & live demo pop ups. Over 180 cases of Sabores were used at this event!", lat: 30.313960, long: -97.719760, imageName: "event2"),
    
    Item(name: "Urban Roots: Tour de Farm", location: "Meanwhile Brewing, Austin", date: "8/15/24" , desc: "Urban Roots works with youth leaders to grow fresh food and build a community dedicated to achieving food equity. This was a farm-to-table experience supporting youth leadership and sustainable agriculture and I am so thankful to have been apart of showcasing this organization and their amazing work!", lat: 30.2962244, long: -97.7079799, imageName: "event3"),
    
    Item(name: "CultureMaps Tastemakers Awards", location: "The Espee, San Antonio", date: "4/26/22" , desc: "An annual event celebrating top culinary talent, I met so many amazing chefs and ate delicious food, with Topo Chico to help cleanse my palette after every sample! Different awards were given out during the ceremony, such as Chef of the Year and Restaurant of the Year, and I was so honored to be apart of it.", lat: 29.424120, long: -98.485690, imageName: "event4"),
    
    Item(name: "Flamin Hot Market", location: "Feliz Modern, San Antonio", date: "2/11/23", desc: "A fiery market event showcasing spicy eats, unique vendors, and Topo Chico. This market was filled with Hot Cheeto themed merchandise from earrings to hoodies, along with a stand selling the TikTok viral Hot Cheeto Pickle snack", lat: 29.426965, long: -98.498303, imageName: "event5"),
    
    Item(name: "Luck Reunion: 10th Anniversary", location: "Luck Ranch, Austin", date: "3/18/22" , desc: "A legendary festival featuring live music, food, and Topo Chico. The 10th anniversay celebration during SXSW was such an awesome experience to have seen live music performances from Willie Nelson, Chuck Prophet, Lucero, and Weyes Blood. There was a lot of people out of town visiting Luck, so it was so nice meeting everyone and making sure everyone was hydrated!", lat: 30.304890, long: -97.726220, imageName: "event6"),
    
    Item(name: "South Congress Thrift Market", location: "South Congress, Austin", date: "9/28/24" , desc: "A curated thrift market with local vendors and Topo Chico. This is Austin's largest creator market with over 200 vendors creators artisans vintage curators all along South Congress. These events are always a hit and we normally sell out of our product within the firs 2/3 hours.", lat: 30.247018, long: -97.747591, imageName: "event7"),
    
    Item(name: "Austin Coffee Festival", location: "Palmer Event Center, Austin", date: "9/29/24" , desc: "A festival celebrating coffee culture with tastings and showcases the best specialty roasters and coffee shops with unique beans, delicious snacks, and live entertainment. This is definitely a one-of-a-kind coffee culture experience and I loved working it! Our Topo Chico Sabores flavors Blueberry&Hibiscus, Lime&Mint, and Tangerine&Ginger were great palette cleansers and hydrators for the coffee connoisseurs of Austin!", lat: 30.265347, long: -97.755221, imageName: "event8"),
    
    Item(name: "OMG Squee Lunar Year Festival", location: "OMG Squee Bakery, Austin", date: "2/28/25" , desc: "OMG Squee hosted a Lunar New Year celebration and birthday bash, celebrating 5 years of the bakery. This festive celerbation featured food and drink pop-ups from Lao'd Bar and Topo Chico, a lion dance, mahjong and many different vendors from jewlery to vintage items. The picture above is a selfie of me and my sweet friend Madden who came to stop by the event and grab a drink! This was such an amazing event to be apart of because I learned so much about the Chinese culture and their traditions for the new year. 2025 is the Year of the Snake, which is a year of growth and development and a time to 'shed the past' or what no longer serves you. I am so happy I got to ring in the New Year with a crisp Topo and be able to share one with others on the hottest day of February!", lat: 30.267153, long: -97.743057, imageName: "event9")

   
]

struct Item {
    var name: String
    var location: String
    var date: String
    var desc: String
    var lat: Double
    var long: Double
    var imageName: String
}










class ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource
 {
    
    
    @IBOutlet weak var theTable: UITableView!
    
    
    
    @IBOutlet weak var mapView: MKMapView!
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return data.count
  }


  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell")
      let item = data[indexPath.row]
      cell?.textLabel?.text = item.name
      
      
      //Add image references
                  let image = UIImage(named: item.imageName)
                  cell?.imageView?.image = image
                  cell?.imageView?.layer.cornerRadius = 10
                  cell?.imageView?.layer.borderWidth = 5
                  cell?.imageView?.layer.borderColor = UIColor.white.cgColor
                  
    
      
      
      
      
      
      return cell!
  }
      
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      let item = data[indexPath.row]
      performSegue(withIdentifier: "ShowDetailSegue", sender: item)
    
  }

    // add this function to original ViewController
         override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           if segue.identifier == "ShowDetailSegue" {
               if let selectedItem = sender as? Item, let detailViewController = segue.destination as? DetailViewController {
                   // Pass the selected item to the detail view controller
                   detailViewController.item = selectedItem
               }
           }
       }
       
           
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        theTable.delegate = self
        theTable.dataSource = self
        
        
        //add this code in viewDidLoad function in the original ViewController, below the self statements

            //set center, zoom level and region of the map
                let coordinate = CLLocationCoordinate2D(latitude: 30.295190, longitude: -97.7444)
                let region = MKCoordinateRegion(center: coordinate,span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
                mapView.setRegion(region, animated: true)
                
             // loop through the items in the dataset and place them on the map
                 for item in data {
                    let annotation = MKPointAnnotation()
                    let eachCoordinate = CLLocationCoordinate2D(latitude: item.lat, longitude: item.long)
                    annotation.coordinate = eachCoordinate
                        annotation.title = item.name
                        mapView.addAnnotation(annotation)
                        }

              

    }


}

