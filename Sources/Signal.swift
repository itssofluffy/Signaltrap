/*
    Signal.swift

    Copyright (c) 2016, 2018 Stephen Whittle  All rights reserved.

    Permission is hereby granted, free of charge, to any person obtaining a copy
    of this software and associated documentation files (the "Software"),
    to deal in the Software without restriction, including without limitation
    the rights to use, copy, modify, merge, publish, distribute, sublicense,
    and/or sell copies of the Software, and to permit persons to whom
    the Software is furnished to do so, subject to the following conditions:
    The above copyright notice and this permission notice shall be included
    in all copies or substantial portions of the Software.
    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
    THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
    LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
    FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
    IN THE SOFTWARE.
*/

#if os(Linux)
import Glibc
import ISFLibrary
#else
import Darwin
#endif

#if os(Linux)
fileprivate let _enumOSDescription: Dictionary<CInt, String> = [SIGHUP    : "SIGHUP",
                                                                SIGINT    : "SIGINT",
                                                                SIGQUIT   : "SIGQUIT",
                                                                SIGILL    : "SIGILL",
                                                                SIGTRAP   : "SIGTRAP",
                                                                SIGABRT   : "SIGABRT",
                                                                SIGBUS    : "SIGBUS",
                                                                SIGFPE    : "SIGFPE",
                                                                SIGKILL   : "SIGKILL",
                                                                SIGUSR1   : "SIGUSR1",
                                                                SIGSEGV   : "SIGSEGV",
                                                                SIGUSR2   : "SIGUSR2",
                                                                SIGPIPE   : "SIGPIPE",
                                                                SIGALRM   : "SIGALRM",
                                                                SIGTERM   : "SIGTERM",
                                                                SIGSTKFLT : "SIGSTKFLT",
                                                                SIGCHLD   : "SIGCHLD",
                                                                SIGCONT   : "SIGCONT",
                                                                SIGSTOP   : "SIGSTOP",
                                                                SIGTSTP   : "SIGTSTP",
                                                                SIGTTIN   : "SIGTTIN",
                                                                SIGTTOU   : "SIGTTOU",
                                                                SIGURG    : "SIGURG",
                                                                SIGXCPU   : "SIGXCPU",
                                                                SIGXFSZ   : "SIGXFSZ",
                                                                SIGVTALRM : "SIGVTALRM",
                                                                SIGPROF   : "SIGPROF",
                                                                SIGWINCH  : "SIGWINCH",
                                                                SIGIO     : "SIGIO",
                                                                SIGPWR    : "SIGPWR",
                                                                SIGSYS    : "SIGSYS"]

fileprivate let _SIGRTMIN = "SIGRTMIN"

fileprivate let _enumDescription: Dictionary<CInt, String> = [SIGHUP    : ".HUP",
                                                              SIGINT    : ".INT",
                                                              SIGQUIT   : ".QUIT",
                                                              SIGILL    : ".ILL",
                                                              SIGTRAP   : ".TRAP",
                                                              SIGABRT   : ".ABRT",
                                                              SIGBUS    : ".BUS",
                                                              SIGFPE    : ".FPE",
                                                              SIGKILL   : ".KILL",
                                                              SIGUSR1   : ".USR1",
                                                              SIGSEGV   : ".SEGV",
                                                              SIGUSR2   : ".USR2",
                                                              SIGPIPE   : ".PIPE",
                                                              SIGALRM   : ".ALRM",
                                                              SIGTERM   : ".TERM",
                                                              SIGSTKFLT : ".STKFLT",
                                                              SIGCHLD   : ".CHLD",
                                                              SIGCONT   : ".CONT",
                                                              SIGSTOP   : ".STOP",
                                                              SIGTSTP   : ".TSTP",
                                                              SIGTTIN   : ".TTIN",
                                                              SIGTTOU   : ".TTOU",
                                                              SIGURG    : ".URG",
                                                              SIGXCPU   : ".XCPU",
                                                              SIGXFSZ   : ".XFSZ",
                                                              SIGVTALRM : ".VTALRM",
                                                              SIGPROF   : ".PROF",
                                                              SIGWINCH  : ".WINCH",
                                                              SIGIO     : ".IO",
                                                              SIGPWR    : ".PWR",
                                                              SIGSYS    : ".SYS"]

fileprivate let SIGRTMIN = __libc_current_sigrtmin()
fileprivate let SIGRTMAX = __libc_current_sigrtmax()

#else
fileprivate let _enumOSDescription: Dictionary<CInt, String> = [SIGHUP    : "SIGHUP",
                                                                SIGINT    : "SIGINT",
                                                                SIGQUIT   : "SIGQUIT",
                                                                SIGILL    : "SIGILL",
                                                                SIGTRAP   : "SIGTRAP",
                                                                SIGABRT   : "SIGABRT",
                                                                SIGBUS    : "SIGBUS",
                                                                SIGFPE    : "SIGFPE",
                                                                SIGKILL   : "SIGKILL",
                                                                SIGUSR1   : "SIGUSR1",
                                                                SIGSEGV   : "SIGSEGV",
                                                                SIGUSR2   : "SIGUSR2",
                                                                SIGPIPE   : "SIGPIPE",
                                                                SIGALRM   : "SIGALRM",
                                                                SIGTERM   : "SIGTERM",
                                                                SIGCHLD   : "SIGCHLD",
                                                                SIGCONT   : "SIGCONT",
                                                                SIGSTOP   : "SIGSTOP",
                                                                SIGTSTP   : "SIGTSTP",
                                                                SIGTTIN   : "SIGTTIN",
                                                                SIGTTOU   : "SIGTTOU",
                                                                SIGURG    : "SIGURG",
                                                                SIGXCPU   : "SIGXCPU",
                                                                SIGXFSZ   : "SIGXFSZ",
                                                                SIGVTALRM : "SIGVTALRM",
                                                                SIGPROF   : "SIGPROF",
                                                                SIGWINCH  : "SIGWINCH",
                                                                SIGIO     : "SIGIO",
                                                                SIGSYS    : "SIGSYS"]

fileprivate let _enumDescription: Dictionary<CInt, String> = [SIGHUP    : ".HUP",
                                                              SIGINT    : ".INT",
                                                              SIGQUIT   : ".QUIT",
                                                              SIGILL    : ".ILL",
                                                              SIGTRAP   : ".TRAP",
                                                              SIGABRT   : ".ABRT",
                                                              SIGBUS    : ".BUS",
                                                              SIGFPE    : ".FPE",
                                                              SIGKILL   : ".KILL",
                                                              SIGUSR1   : ".USR1",
                                                              SIGSEGV   : ".SEGV",
                                                              SIGUSR2   : ".USR2",
                                                              SIGPIPE   : ".PIPE",
                                                              SIGALRM   : ".ALRM",
                                                              SIGTERM   : ".TERM",
                                                              SIGCHLD   : ".CHLD",
                                                              SIGCONT   : ".CONT",
                                                              SIGSTOP   : ".STOP",
                                                              SIGTSTP   : ".TSTP",
                                                              SIGTTIN   : ".TTIN",
                                                              SIGTTOU   : ".TTOU",
                                                              SIGURG    : ".URG",
                                                              SIGXCPU   : ".XCPU",
                                                              SIGXFSZ   : ".XFSZ",
                                                              SIGVTALRM : ".VTALRM",
                                                              SIGPROF   : ".PROF",
                                                              SIGWINCH  : ".WINCH",
                                                              SIGIO     : ".IO",
                                                              SIGSYS    : ".SYS"]
#endif

internal var _signalState = Dictionary<CInt, SignalState>()

fileprivate func _unknownSignal(_ number: CInt) -> String {
    return "Unknown signal #\(number)"
}

public enum Signal {
    case HUP
    case INT
    case QUIT
    case ILL
    case TRAP
    case ABRT
    case BUS
    case FPE
    case KILL
    case USR1
    case SEGV
    case USR2
    case PIPE
    case ALRM
    case TERM
#if os(Linux)
    case STKFLT
#endif
    case CHLD
    case CONT
    case STOP
    case TSTP
    case TTIN
    case TTOU
    case URG
    case XCPU
    case XFSZ
    case VTALRM
    case PROF
    case WINCH
    case IO
#if os(Linux)
    case PWR
#endif
    case SYS
#if os(Linux)
    case RT(Int)
#endif

#if os(Linux)
    public static let allSignals = Array(arrayLiteral: HUP, INT, QUIT, ILL, TRAP,
                                                       ABRT, BUS, FPE, /* KILL, */ USR1,
                                                       SEGV, USR2, PIPE, ALRM, TERM,
                                                       STKFLT, CHLD, CONT, /* STOP, */ TSTP,
                                                       TTIN, TTOU, URG, XCPU, XFSZ,
                                                       VTALRM, PROF, WINCH, IO, PWR,
                                                       SYS)
#else
    public static let allSignals = Array(arrayLiteral: HUP, INT, QUIT, ILL, TRAP,
                                                       ABRT, BUS, FPE, /* KILL, */ USR1,
                                                       SEGV, USR2, PIPE, ALRM, TERM,
                                                       CHLD, CONT, /* STOP, */ TSTP,
                                                       TTIN, TTOU, URG, XCPU, XFSZ,
                                                       VTALRM, PROF, WINCH, IO,
                                                       SYS)
#endif

#if os(Linux)
    public static let minRealTimeSignal: Int = 0
    public static let maxRealTimeSignal = Int(SIGRTMAX - SIGRTMIN)
#endif

    public init(rawValue: CInt) {
#if os(Linux)
        switch rawValue {
            case SIGHUP:
                self = .HUP
            case SIGINT:
                self = .INT
            case SIGQUIT:
                self = .QUIT
            case SIGILL:
                self = .ILL
            case SIGTRAP:
                self = .TRAP
            case SIGABRT:
                self = .ABRT
            case SIGBUS:
                self = .BUS
            case SIGFPE:
                self = .FPE
            case SIGKILL:
                self = .KILL
            case SIGUSR1:
                self = .USR1
            case SIGSEGV:
                self = .SEGV
            case SIGUSR2:
                self = .USR2
            case SIGPIPE:
                self = .PIPE
            case SIGALRM:
                self = .ALRM
            case SIGTERM:
                self = .TERM
            case SIGSTKFLT:
                self = .STKFLT
            case SIGCHLD:
                self = .CHLD
            case SIGCONT:
                self = .CONT
            case SIGSTOP:
                self = .STOP
            case SIGTSTP:
                self = .TSTP
            case SIGTTIN:
                self = .TTIN
            case SIGTTOU:
                self = .TTOU
            case SIGURG:
                self = .URG
            case SIGXCPU:
                self = .XCPU
            case SIGXFSZ:
                self = .XFSZ
            case SIGVTALRM:
                self = .VTALRM
            case SIGPROF:
                self = .PROF
            case SIGWINCH:
                self = .WINCH
            case SIGIO:
                self = .IO
            case SIGPWR:
                self = .PWR
            case SIGSYS:
                self = .SYS
            default:
                guard (rawValue >= SIGRTMIN && rawValue <= SIGRTMAX) else {
                    fatalError(_unknownSignal(rawValue))
                }

                let realtimeSignal = Int(rawValue - SIGRTMIN)

                self = .RT(clamp(value: realtimeSignal, lower: Signal.minRealTimeSignal, upper: Signal.maxRealTimeSignal))
        }
#else
        switch rawValue {
            case SIGHUP:
                self = .HUP
            case SIGINT:
                self = .INT
            case SIGQUIT:
                self = .QUIT
            case SIGILL:
                self = .ILL
            case SIGTRAP:
                self = .TRAP
            case SIGABRT:
                self = .ABRT
            case SIGBUS:
                self = .BUS
            case SIGFPE:
                self = .FPE
            case SIGKILL:
                self = .KILL
            case SIGUSR1:
                self = .USR1
            case SIGSEGV:
                self = .SEGV
            case SIGUSR2:
                self = .USR2
            case SIGPIPE:
                self = .PIPE
            case SIGALRM:
                self = .ALRM
            case SIGTERM:
                self = .TERM
            case SIGCHLD:
                self = .CHLD
            case SIGCONT:
                self = .CONT
            case SIGSTOP:
                self = .STOP
            case SIGTSTP:
                self = .TSTP
            case SIGTTIN:
                self = .TTIN
            case SIGTTOU:
                self = .TTOU
            case SIGURG:
                self = .URG
            case SIGXCPU:
                self = .XCPU
            case SIGXFSZ:
                self = .XFSZ
            case SIGVTALRM:
                self = .VTALRM
            case SIGPROF:
                self = .PROF
            case SIGWINCH:
                self = .WINCH
            case SIGIO:
                self = .IO
            case SIGSYS:
                self = .SYS
            default:
                fatalError(_unknownSignal(rawValue))
        }
#endif
    }

    public var number: CInt {
#if os(Linux)
        switch self {
            case .HUP:
                return SIGHUP
            case .INT:
                return SIGINT
            case .QUIT:
                return SIGQUIT
            case .ILL:
                return SIGILL
            case .TRAP:
                return SIGTRAP
            case .ABRT:
                return SIGABRT
            case .BUS:
                return SIGBUS
            case .FPE:
                return SIGFPE
            case .KILL:
                return SIGKILL
            case .USR1:
                return SIGUSR1
            case .SEGV:
                return SIGSEGV
            case .USR2:
                return SIGUSR2
            case .PIPE:
                return SIGPIPE
            case .ALRM:
                return SIGALRM
            case .TERM:
                return SIGTERM
            case .STKFLT:
                return SIGSTKFLT
            case .CHLD:
                return SIGCHLD
            case .CONT:
                return SIGCONT
            case .STOP:
                return SIGSTOP
            case .TSTP:
                return SIGTSTP
            case .TTIN:
                return SIGTTIN
            case .TTOU:
                return SIGTTOU
            case .URG:
                return SIGURG
            case .XCPU:
                return SIGXCPU
            case .XFSZ:
                return SIGXFSZ
            case .VTALRM:
                return SIGVTALRM
            case .PROF:
                return SIGPROF
            case .WINCH:
                return SIGWINCH
            case .IO:
                return SIGIO
            case .PWR:
                return SIGPWR
            case .SYS:
                return SIGSYS
            case .RT(let realtimeSignal):
                return SIGRTMIN + CInt(realtimeSignal)
        }
#else
        switch self {
            case .HUP:
                return SIGHUP
            case .INT:
                return SIGINT
            case .QUIT:
                return SIGQUIT
            case .ILL:
                return SIGILL
            case .TRAP:
                return SIGTRAP
            case .ABRT:
                return SIGABRT
            case .BUS:
                return SIGBUS
            case .FPE:
                return SIGFPE
            case .KILL:
                return SIGKILL
            case .USR1:
                return SIGUSR1
            case .SEGV:
                return SIGSEGV
            case .USR2:
                return SIGUSR2
            case .PIPE:
                return SIGPIPE
            case .ALRM:
                return SIGALRM
            case .TERM:
                return SIGTERM
            case .CHLD:
                return SIGCHLD
            case .CONT:
                return SIGCONT
            case .STOP:
                return SIGSTOP
            case .TSTP:
                return SIGTSTP
            case .TTIN:
                return SIGTTIN
            case .TTOU:
                return SIGTTOU
            case .URG:
                return SIGURG
            case .XCPU:
                return SIGXCPU
            case .XFSZ:
                return SIGXFSZ
            case .VTALRM:
                return SIGVTALRM
            case .PROF:
                return SIGPROF
            case .WINCH:
                return SIGWINCH
            case .IO:
                return SIGIO
            case .SYS:
                return SIGSYS
        }
#endif
    }

    public var state: SignalState {
        if let state = _signalState[number] {
            return state
        }

        return .Default
    }
}

extension Signal {
    public var name: String {
        return String(cString: strsignal(number))
    }

    public var enumDescription: String {
#if os(Linux)
        if (number >= SIGRTMIN) {
            let realtimeSignal = number - SIGRTMIN
            return ".RT(\(realtimeSignal))"
        }
#endif

        if let description = _enumDescription[number] {
            return description
        }

        fatalError(_unknownSignal(number))
    }

    public var enumOSDescription: String {
#if os(Linux)
        if (number == SIGRTMIN) {
            return _SIGRTMIN
        } else if (number > SIGRTMIN) {
            let sigrtminPlus = number - SIGRTMIN
            return "\(_SIGRTMIN)+\(sigrtminPlus))"
        }
#endif

        if let description = _enumOSDescription[number] {
            return description
        }

        fatalError(_unknownSignal(number))
    }
}

extension Signal: CustomStringConvertible {
    public var description: String {
        return "\(name) (\(enumDescription))"
    }
}

extension Signal: CustomDebugStringConvertible {
    public var debugDescription: String {
        return "\(name) (#\(number)/\(enumOSDescription)/\(enumDescription))"
    }
}
