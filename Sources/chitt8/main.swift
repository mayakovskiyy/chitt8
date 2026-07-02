import Foundation
import AppKit

@MainActor
class Chitt8 {
    var memory = [UInt8](repeating: 0, count: 4096)
    var V = [UInt8](repeating: 0, count: 16)
    var I: UInt16 = 0
    var pc: UInt16 = 0x200
    var delayTimer: UInt8 = 0
    var soundTimer: UInt8 = 0
    var display = [Bool](repeating: false, count: 64 * 32)
    var stack = [UInt16](repeating:  0, count: 16)
    var sp: UInt16 = 0
    var kp = [Bool](repeating: false, count: 16)
    
    var window: NSWindow?
    
    let fontset: [UInt8] = [
        0xF0, 0x90, 0x90, 0x90, 0xF0,  // 0
        0x20, 0x60, 0x20, 0x20, 0x70,  // 1
        0xF0, 0x10, 0xF0, 0x80, 0xF0,  // 2
        0xF0, 0x10, 0xF0, 0x10, 0xF0,  // 3
        0x90, 0x90, 0xF0, 0x10, 0x10,  // 4
        0xF0, 0x80, 0xF0, 0x10, 0xF0,  // 5
        0xF0, 0x80, 0xF0, 0x90, 0xF0,  // 6
        0xF0, 0x10, 0x20, 0x40, 0x40,  // 7
        0xF0, 0x90, 0xF0, 0x90, 0xF0,  // 8
        0xF0, 0x90, 0xF0, 0x10, 0xF0,  // 9
        0xF0, 0x90, 0xF0, 0x90, 0x90,  // A
        0xE0, 0x90, 0xE0, 0x90, 0xE0,  // B
        0xF0, 0x80, 0x80, 0x80, 0xF0,  // C
        0xE0, 0x90, 0x90, 0x90, 0xE0,  // D
        0xF0, 0x80, 0xF0, 0x80, 0xF0,  // E
        0xF0, 0x80, 0xF0, 0x80, 0x80,  // F
    ]
    
    init() {
        let rect = NSRect(x: 100, y: 200, width: 640, height: 320)
        let style_mask: NSWindow.StyleMask = [.titled, .closable, .miniaturizable, .fullSizeContentView]
        self.window = NSWindow(contentRect: rect, styleMask: style_mask, backing: .buffered, defer: false)
        
        window?.title = "chitt8 - THE CHIP-8 EMULATOR"
        window?.center()
        
        let view_controller = NSViewController()
        view_controller.view = NSView(frame: rect)
        view_controller.view.wantsLayer = true
        view_controller.view.layer?.backgroundColor = NSColor.windowBackgroundColor.cgColor
        
        window?.makeKeyAndOrderFront(nil)
    }
}
