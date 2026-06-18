import Foundation
import SDL

guard SDL_Init(SDL_INIT_VIDEO) == 0 else {
    fatalError("SDL could not initialize! SDL_Error: \(String(cString: SDL_GetError()))")
}
    var memory = [UInt8](repeating: 0, count: 4096)
    var V = [UInt8](repeating: 0, count: 16)
    var I: UInt16 = 0
    var pc = 0x200  // 512
    var delayTimer: UInt8 = 0
    var soundTimer: UInt8 = 0
    var display = [Bool](repeating: false, count: 64 * 32)
    var stack = [UInt16](repeating: 0, count: 16)
    var sp: UInt16 = 0
    var kp = [Bool](repeating: false, count: 16)

    let window = SDL_CreateWindow(
        "chitt8 - A CHIP-8 EMULATOR", SDL_WINDOWPOS_CENTERED, SDL_WINDOWPOS_CENTERED, 640, 320, 0)

    var quit = false
    var event = SDL_Event()

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

}

let emuData = c8emu()

while !emuData.quit {
    while SDL_PollEvent(&emuData.event) > 0 {
        if emuData.event.type == SDL_QUIT().rawValue {
            emuData.quit = true
        }
    }
    SDL_Delay(100)
}

SDL_DestroyWindow(emuData.window)

SDL_Quit()
