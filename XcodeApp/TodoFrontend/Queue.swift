//
//  Queue.swift
//  TodoFrontend
//
//  Created by Scott Byrns on 4/16/16.
//  Copyright © 2016 Zewo. All rights reserved.
//

protocol Queue {
    associatedtype Item
    func enqueue(item: Item)
    func dequeue() -> Item
}
