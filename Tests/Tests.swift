import UIKit
import XCTest
import JSON
import NSDictionary_ANDYSafeValue

class Tests: XCTestCase {
    func testAddingDateGroupingToJSON() {
        let result = try! JSON.from("original.json", bundle: NSBundle(forClass: Tests.self)) as! NSDictionary
        let converted = result.normalize()

        let expected = [
            [
                "id": 2559,
                "url": "https://rescuejuice.com/news/stavkroa/",
                "title": "Stavkroa",
                "content": "<p>Forage disrupt kale chips authentic, retro gluten-free lo-fi brunch scenester wolf aesthetic umami shabby chic messenger bag. Chartreuse organic ugh, health goth lumbersexual authentic hammock locavore chambray whatever literally tacos kickstarter. Biodiesel echo park deep v irony, tumblr listicle keffiyeh mixtape stumptown pork belly paleo synth taxidermy chambray kinfolk. Bicycle rights +1 chia selvage godard. Distillery pitchfork chia, waistcoat sriracha tattooed blog deep v cray gluten-free next level ethical. Art party meditation fingerstache, PBR&amp;B irony williamsburg before they sold out blog locavore knausgaard. Meggings biodiesel tattooed pitchfork distillery.</p>\n<p><a href=\"https://rescuejuice.com/wp-content/uploads/2015/11/døgnvillburgere.jpg\"><img class=\"alignnone size-full wp-image-2372\" src=\"https://rescuejuice.com/wp-content/uploads/2015/11/døgnvillburgere.jpg\" alt=\"døgnvillburgere\" width=\"799\" height=\"533\" srcset=\"https://rescuejuice.com/wp-content/uploads/2015/11/døgnvillburgere-600x400.jpg 600w, https://rescuejuice.com/wp-content/uploads/2015/11/døgnvillburgere.jpg 799w\" sizes=\"(max-width: 799px) 100vw, 799px\" /></a></p>\n<p>YOLO butcher quinoa everyday carry seitan ethical. Art party 3 wolf moon pour-over cardigan. Occupy street art cardigan, fanny pack portland PBR&amp;B meditation flannel cronut asymmetrical organic blog drinking vinegar. Sustainable freegan lo-fi, celiac butcher cornhole salvia heirloom keffiyeh. Lumbersexual trust fund etsy disrupt asymmetrical tofu normcore, four loko leggings quinoa locavore lomo. Kombucha four dollar toast cronut, pug etsy sriracha mustache godard roof party meditation thundercats try-hard bitters you probably haven&#8217;t heard of them sartorial. Pitchfork artisan roof party keytar beard bitters.</p>\n<p><a href=\"https://rescuejuice.com/wp-content/uploads/2015/11/snow-653916.jpg\"><img class=\"alignnone size-full wp-image-2377\" src=\"https://rescuejuice.com/wp-content/uploads/2015/11/snow-653916.jpg\" alt=\"snow-653916\" width=\"2592\" height=\"1944\" srcset=\"https://rescuejuice.com/wp-content/uploads/2015/11/snow-653916-800x600.jpg 800w, https://rescuejuice.com/wp-content/uploads/2015/11/snow-653916-1000x750.jpg 1000w, https://rescuejuice.com/wp-content/uploads/2015/11/snow-653916-1440x1080.jpg 1440w\" sizes=\"(max-width: 2592px) 100vw, 2592px\" /></a></p>\n",
                "image_url": "https://rescuejuice.com/wp-content/uploads/2015/07/rescuejuice-on-white-table-noeblog2-800x305.jpg",
                "latitude": "60.862251",
                "longitude": "8.517151",
                "city": "Hemsedal",
                "address": "Hemsedal - Sentrum"
            ]
        ]

        XCTAssertEqual(converted, expected)
    }

    func testEmptyJSON() {
        let result = NSDictionary()
        let converted = result.normalize()
        XCTAssertEqual(converted, NSArray())
    }
}