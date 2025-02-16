//
//  CreateMockedProduct.swift
//  App
//
//  Created by Si Huynh on 2025/02/06.
//

import Fluent
import Vapor

struct CreateMockedProduct: Migration {
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        let products = [
            Product(
                name: "iPhone 15",
                description:
                    "The iPhone 15 features a powerful A16 Bionic chip, an advanced dual-camera system, and a stunning Super Retina XDR display. Experience the next generation of iPhone with improved battery life and innovative features.",
                price: 999,
                stock: 50,
                image:
                    "https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/iphone-15-pro-finish-select-202309-6-7inch_GEO_US?wid=5120&hei=2880&fmt=p-jpg&qlt=80&.v=1693009284541"
            ),
            Product(
                name: "MacBook Pro",
                description:
                    "The MacBook Pro delivers game-changing performance for pro users. With the M2 Pro or M2 Max chip, stunning Liquid Retina XDR display, and up to 22 hours of battery life, it's the ultimate tool for developers, photographers, and creators.",
                price: 1999,
                stock: 30,
                image:
                    "https://www.apple.com/v/macbook-pro-14-and-16/e/images/overview/hero/hero_intro_endframe__e6khcva4hkeq_large.jpg"
            ),
            Product(
                name: "AirPods Pro",
                description:
                    "AirPods Pro feature Active Noise Cancellation, Adaptive Transparency, and Personalized Spatial Audio that adjusts as you move. A magical experience with effortless setup and crystal-clear sound.",
                price: 249,
                stock: 100,
                image:
                    "https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/MME73?wid=1144&hei=1144&fmt=jpeg&qlt=95&.v=1632861342000"
            ),
            Product(
                name: "iPad Air",
                description:
                    "The iPad Air features the breakthrough M1 chip, Ultra Wide front camera with Center Stage, 5G connectivity, and a stunning 10.9-inch Liquid Retina display with True Tone. Perfect for creativity and productivity on the go.",
                price: 599,
                stock: 40,
                image:
                    "https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/ipad-air-select-wifi-blue-202203?wid=940&hei=1112&fmt=png-alpha&.v=1645065732688"
            ),
            Product(
                name: "Apple Watch",
                description:
                    "The Apple Watch helps you stay connected, active, healthy, and safe. With powerful health features, fitness tracking, and cellular connectivity, it's the ultimate device for a healthy life.",
                price: 399,
                stock: 60,
                image:
                    "https://fdn2.gsmarena.com/vv/pics/apple/apple-watch-series9-2.jpg"
            ),
            Product(
                name: "Samsung Galaxy S25",
                description:
                    "The Samsung Galaxy S25 represents the pinnacle of smartphone innovation with its advanced AI features, exceptional camera system, and powerful performance. Experience the future of mobile technology.",
                price: 999,
                stock: 45,
                image:
                    "https://samcenter.vn/images/thumbs/0010677_samsung-galaxy-s25-ultra-256gb.png"
            ),
            Product(
                name: "Sony PlayStation 5",
                description:
                    "Experience lightning-fast loading, deeper immersion with haptic feedback, adaptive triggers, and stunning 4K graphics. The PS5 delivers next-generation gaming with revolutionary features and breathtaking games.",
                price: 499,
                stock: 25,
                image:
                    "https://media.direct.playstation.com/is/image/sierialto/PS5-digital-edition-front-with-dualsense"
            ),
            Product(
                name: "Nintendo Switch",
                description:
                    "The Nintendo Switch is a versatile gaming system that lets you play your favorite games anywhere. With its hybrid design, HD rumble, and extensive game library, it offers endless entertainment for everyone.",
                price: 299,
                stock: 35,
                image:
                    "https://assets.nintendo.com/image/upload/f_auto/q_auto/dpr_2.0/c_scale,w_400/ncom/en_US/switch/site-design-update/hardware/switch/nintendo-switch-oled-model-white-set/gallery/image01"
            ),
        ]
        return products.map { $0.save(on: database) }.flatten(on: database.eventLoop)
    }

    func revert(on database: Database) -> EventLoopFuture<Void> {
        return Product.query(on: database).delete()
    }
}
