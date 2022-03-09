import UIKit

protocol Wallet {
    associatedtype ID
    
    
    var amount: Double { get }
    var id: ID { get }
    
    mutating func setNewAmount(_ amount: Double)
}

struct PiggyBank: Wallet {
    typealias ID = String
    
    var id: String = ""
    var amount: Double = 0.0
    
    mutating func setNewAmount(_ amount: Double) {
        self.amount = amount.rounded()
    }
}

var myPiggyBank = PiggyBank(amount: 20)
myPiggyBank.setNewAmount(50)

enum VirtualWalletType {
    case bitcoin
    case etherum
}

extension VirtualWalletType: Wallet {
    typealias ID = UUID
    
    var id: UUID {
        return UUID()
    }
    var amount: Double {
        return 0
    }

    mutating func setNewAmount(_ amount: Double) {
    }
}


// Generics - le folosim cand vrem sa fie specializat pe ceva
class WalletManager<T: Wallet> {
    var wallet: T
    
    init(wallet: T) {
        self.wallet = wallet
    }
    
    func merge(with wallet: T) {
        
    }
}

func mergeAmounts<T: Wallet, U: Wallet>(walletA: T, walletB: U) -> Double {
    return walletA.amount + walletB.amount
}

let myWalletManager = WalletManager(wallet: myPiggyBank)
let piggyBankTwo = PiggyBank(amount: 40)
myWalletManager.merge(with: piggyBankTwo)

// Opaque Type -> ca sa nu tot scrii
func createWallet() -> some Wallet {
    return PiggyBank(amount: 20)
}

// doesn't work like that, because generics is specialised
//myWalletManager.merge(with: VirtualWalletType.bitcoin)



